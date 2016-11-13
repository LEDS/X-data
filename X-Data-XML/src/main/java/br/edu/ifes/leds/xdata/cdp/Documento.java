package br.edu.ifes.leds.xdata.cdp;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamOmitField;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Date;

/**
 * Created by paulosantosjunior on 08/11/16.
 */
@XStreamAlias("Documento")
public class Documento implements XData{


    @XStreamAlias("data_criacao")
    private Date datacriacao = new Date();

    @XStreamAlias("instituicoes")
    private List<Instituicao> instituicoes = new ArrayList<Instituicao>();

    @XStreamOmitField
    private HashMap<String, Instituicao> instituicoes_hash = new HashMap<String, Instituicao>();

    public void adicionarInstituicao(Instituicao instituicao){

        if (!existe(instituicao.getNome())){
            instituicoes_hash.put(instituicao.getNome(),instituicao);
            instituicoes.add(instituicao);
        }
        else{
            instituicao = instituicoes_hash.get(instituicao.getNome());
        }
    }

    public boolean existe(String nome){
        return  instituicoes_hash.containsKey(nome);
    }

    public Instituicao retornarInstituicao(String nome){
        return instituicoes_hash.get(nome);
    }
}
