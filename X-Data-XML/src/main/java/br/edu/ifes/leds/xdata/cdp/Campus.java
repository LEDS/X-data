package br.edu.ifes.leds.xdata.cdp;

import com.thoughtworks.xstream.annotations.XStreamAlias;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by paulosantosjunior on 06/11/16.
 */

@XStreamAlias("Campus")
public class Campus implements XData{

    @XStreamAlias("nome")
    private String nome;

    @XStreamAlias("departamentos")
    private List<Departamento> departamentos = new ArrayList<Departamento>();

    public void adicionarDepartamento (Departamento departamento){

        departamentos.add(departamento);

    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
