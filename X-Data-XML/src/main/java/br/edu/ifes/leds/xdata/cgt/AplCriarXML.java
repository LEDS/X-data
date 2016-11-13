package br.edu.ifes.leds.xdata.cgt;

import br.edu.ifes.leds.xdata.cdp.*;
import br.edu.ifes.leds.xdata.cgd.CSVRepository;
import br.edu.ifes.leds.xdata.cgd.XMLRepository;
import br.edu.ifes.leds.xdata.util.XDataUtil;
import org.apache.commons.csv.CSVRecord;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.text.ParseException;
import java.util.HashMap;

/**
 * Created by paulosantosjunior on 08/11/16.
 */
public class AplCriarXML {


    private Instituicao instituicao = new Instituicao();

    // Hash do campus
    private HashMap<String, Campus> campi_hash = new HashMap<String, Campus>();

    private HashMap<String,Departamento> departamento_hashmap = new HashMap<String, Departamento>();

    private HashMap<String,Curso> curso_hashmap = new HashMap<String, Curso>();

    private HashMap<String,Aluno> aluno_hashmap = new HashMap<String, Aluno>();

    private HashMap<String,Pessoa> pessoa_hashmap = new HashMap<String, Pessoa>();

    public Pessoa adicionarPessoa(String CPF,
                    String data_Conclusao_Ensino_Medio,
                            String data_Nascimento,
                            String sexo,
                            String cor) throws UnsupportedEncodingException, ParseException, NoSuchProviderException, NoSuchAlgorithmException {

        Pessoa pessoa;
        String chave = XDataUtil.INSTANCE.encripitar(CPF+data_Nascimento+data_Conclusao_Ensino_Medio+sexo+cor);

        if (!pessoa_hashmap.containsKey(chave)){
            pessoa = new Pessoa();

            pessoa.setCodigoSocial(chave);
            pessoa.setCor(cor);
            pessoa.setConclusaoEnsinoMedio(data_Conclusao_Ensino_Medio);
            pessoa.setDataNascimento(data_Nascimento);
            pessoa.setSexo(sexo);

            instituicao.adicionarPessoa(pessoa);

            pessoa_hashmap.put(chave,pessoa);
        }else{
            pessoa = pessoa_hashmap.get(chave);
        }

        return pessoa;

    }

    public Departamento adicionarDepartamento (String nomeDepartamento, Campus campus){

        Departamento departamento;

        if (!departamento_hashmap.containsKey(nomeDepartamento)){
            departamento = new Departamento();
            departamento.setNome(nomeDepartamento);
            campus.adicionarDepartamento(departamento);
            departamento_hashmap.put(departamento.getNome(),departamento);
        }else{
            departamento = departamento_hashmap.get(nomeDepartamento);
        }

        return departamento;
    }





    public Campus adicionarCampus (String  nomeCampus){

        Campus campus;
        if (!campi_hash.containsKey(nomeCampus)){
            campus = new Campus();
            campus.setNome(nomeCampus);
            campi_hash.put(campus.getNome(),campus);
            //adicionando o campus na instituicao
            instituicao.adicionarCampus(campus);

        }
        else{
            campus = campi_hash.get(nomeCampus);
        }

        return campus;
    }

    public Aluno adicionarAluno(String matricula, Curso curso) throws UnsupportedEncodingException, NoSuchProviderException, NoSuchAlgorithmException{

        Aluno aluno;

        if (!aluno_hashmap.containsKey(matricula)){
            aluno = new Aluno();
            aluno.setMatricula(matricula);
            aluno_hashmap.put(matricula,aluno);
            //adicionando o campus na instituicao
            curso.adicionarAluno(aluno);

        }
        else{
            aluno = aluno_hashmap.get(matricula);
        }

        return aluno;


    }


    public Curso adicionarCurso (String  nomeCurso, String sigla, Departamento departamento){

        Curso curso;
        if (!curso_hashmap.containsKey(sigla)){
            curso = new Curso();
            curso.setNome(nomeCurso);
            curso.setSigla(sigla);
            curso_hashmap.put(sigla,curso);
            //adicionando o campus na instituicao
            departamento.adicionarCurso(curso);

        }
        else{
            curso = curso_hashmap.get(sigla);
        }

        return curso;
    }

    public void atribuirSituacao (String situacao, String dataConlusao, String periodo_Inicial, String ano_inicial, String periodo, String ano, Aluno aluno) throws ParseException {

        Situacao matriculado = new Situacao();
        matriculado.setSituacao("Matriculado");
        matriculado.setAno(ano_inicial);
        matriculado.setSemestre(periodo_Inicial);

        aluno.adicionarSituacaoAluno(matriculado);

        if (!situacao.equals("Matriculado")){

            Situacao situacao_x = new Situacao();

            situacao_x.setSituacao(situacao);
            situacao_x.setDataSituacao(dataConlusao);
            situacao_x.setAno(ano);
            situacao_x.setSemestre(periodo);

            aluno.adicionarSituacaoAluno(situacao_x);

        }

    }

    public void criarXML (String caminhoCSV, String caminhoXML) throws Exception {

        CSVRepository csvRepository = new CSVRepository();
        Iterable<CSVRecord>  records = csvRepository.ler(caminhoCSV);

        Documento documento = new Documento();
        instituicao.setNome("IFES");
        documento.adicionarInstituicao(instituicao);

        for (CSVRecord record : records) {

            Campus campus = adicionarCampus(record.get("Instituicao"));

            Pessoa pessoa = adicionarPessoa(record.get("CPF"),
                    record.get("Data_Conclusao_Ensino_Medio"),
                    record.get("Data_Nascimento"),
                    record.get("Sexo"),
                    record.get("Cor"));

            Departamento departamento = adicionarDepartamento(record.get("Desc_Departamento"),campus);
            Curso curso = adicionarCurso(record.get("Descricao_Curso"),record.get("Sigla_Curso"), departamento);

            Aluno aluno = adicionarAluno(record.get("Matricula"),curso);
            pessoa.adicionarAluno(aluno);

            atribuirSituacao(record.get("Situacao_Matricula"),
                            record.get("Data_Conclusao_Curso"),
                    record.get("Periodo_Letivo_Ini"),
                    record.get("Ano_Letivo_Ini"),
                    record.get("Periodo_Let"),
                    record.get("Ano_Let"),
                    aluno);


        }

        XMLRepository xmlRepository = new XMLRepository();
        xmlRepository.criarArquivo(documento,caminhoXML);


    }

}
