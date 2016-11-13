package br.edu.ifes.leds.xdata.cdp;

import com.thoughtworks.xstream.annotations.XStreamAlias;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by paulosantosjunior on 07/11/16.
 */
@XStreamAlias("Curso")
public class Curso implements XData{

    @XStreamAlias("nome")
    private String nome;

    @XStreamAlias("sigla")
    private String sigla;

    @XStreamAlias("alunos")
    private List<Aluno> alunos = new ArrayList<Aluno>();

    public void adicionarAluno(Aluno aluno){
        getAlunos().add(aluno);
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }


    public List<Aluno> getAlunos() {
        return alunos;
    }

    public void setAlunos(List<Aluno> alunos) {
        this.alunos = alunos;
    }
}
