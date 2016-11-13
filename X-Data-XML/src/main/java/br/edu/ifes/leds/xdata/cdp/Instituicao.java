package br.edu.ifes.leds.xdata.cdp;

import com.thoughtworks.xstream.annotations.XStreamAlias;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by paulosantosjunior on 07/11/16.
 */
@XStreamAlias("Instituicao")
public class Instituicao implements XData{

    @XStreamAlias("nome")
    private String nome;

    @XStreamAlias("campi")
    private List<Campus> campi = new ArrayList<Campus>();

    @XStreamAlias("pessoas")
    private List<Pessoa> pessoas = new ArrayList<Pessoa>();

    public void adicionarCampus (Campus campus){

            campi.add(campus);

    }

    public void adicionarPessoa (Pessoa pessoa){

        pessoas.add(pessoa);

    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
