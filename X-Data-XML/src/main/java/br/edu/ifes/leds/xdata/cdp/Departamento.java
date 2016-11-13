package br.edu.ifes.leds.xdata.cdp;

import com.thoughtworks.xstream.annotations.XStreamAlias;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by paulosantosjunior on 07/11/16.
 */

@XStreamAlias("Departamento")
public class Departamento implements XData{

    @XStreamAlias("nome")
    private String nome;

    @XStreamAlias("cursos")
    private List<Curso> cursos = new ArrayList<Curso>();

    public void adicionarCurso (Curso curso){
       cursos.add(curso);
   }


    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
