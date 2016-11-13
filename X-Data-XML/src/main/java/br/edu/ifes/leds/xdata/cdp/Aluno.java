package br.edu.ifes.leds.xdata.cdp;

import br.edu.ifes.leds.xdata.util.XDataUtil;
import com.thoughtworks.xstream.annotations.XStreamAlias;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by paulosantosjunior on 06/11/16.
 */

@XStreamAlias("Aluno")
public class Aluno implements XData{

    @XStreamAlias("matricula")
    private String matricula;

    @XStreamAlias("situacaoes")
    private List<Situacao> situacoes = new ArrayList<Situacao>();

    public void adicionarSituacaoAluno(Situacao situacao){
        situacoes.add(situacao);
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) throws NoSuchProviderException, UnsupportedEncodingException,NoSuchAlgorithmException {

        this.matricula = XDataUtil.INSTANCE.encripitar(matricula);
    }
}
