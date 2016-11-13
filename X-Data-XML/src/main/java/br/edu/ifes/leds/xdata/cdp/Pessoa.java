package br.edu.ifes.leds.xdata.cdp;

import br.edu.ifes.leds.xdata.util.XDataUtil;
import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamImplicit;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by paulosantosjunior on 06/11/16.
 */

@XStreamAlias("Pessoa")
public class Pessoa implements XData{

    @XStreamAlias("codigo_social")
    private String codigoSocial;

    @XStreamAlias("data_nascimento")
    private Date dataNascimento;

    @XStreamAlias("conclusao_ensino_medio")
    private Date  conclusaoEnsinoMedio;

    @XStreamAlias("sexo")
    private String sexo;

    @XStreamAlias("cor")
    private String cor;

    @XStreamImplicit
    @XStreamAlias("alunos")
    private List<Aluno> alunos = new ArrayList<Aluno>();

    public void adicionarAluno (Aluno aluno){
        alunos.add(aluno);
    }


    public String getCodigoSocial() {
        return codigoSocial;
    }

    public void setCodigoSocial(String codigoSocial) throws UnsupportedEncodingException, NoSuchProviderException, NoSuchAlgorithmException {

        this.codigoSocial = XDataUtil.INSTANCE.encripitar(codigoSocial);
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(String dataNascimento) throws ParseException {

        this.dataNascimento = XDataUtil.INSTANCE.converterStringData(dataNascimento);
    }

    public Date getConclusaoEnsinoMedio() {
        return conclusaoEnsinoMedio;
    }

    public void setConclusaoEnsinoMedio(String conclusaoEnsinoMedio) throws ParseException {

        this.conclusaoEnsinoMedio = XDataUtil.INSTANCE.converterStringData(conclusaoEnsinoMedio);

    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }


}
