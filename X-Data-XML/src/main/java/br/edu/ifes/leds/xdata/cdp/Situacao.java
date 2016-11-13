package br.edu.ifes.leds.xdata.cdp;

import br.edu.ifes.leds.xdata.util.XDataUtil;
import com.thoughtworks.xstream.annotations.XStreamAlias;

import java.text.ParseException;
import java.util.Date;

/**
 * Created by paulosantosjunior on 07/11/16.
 */
@XStreamAlias("Situacao")
public class Situacao implements XData{

    @XStreamAlias("situacao")
    private String situacao;

    @XStreamAlias("ano")
    private String ano;

    @XStreamAlias("semestre")
    private String semestre;

    @XStreamAlias("data_situacao")
    private Date dataSituacao;


    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

    public Date getData_situacao() {
        return dataSituacao;
    }

    public void setDataSituacao(String dataSituacao) throws ParseException {

        this.dataSituacao = XDataUtil.INSTANCE.converterStringData(dataSituacao);
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    public String getSemestre() {
        return semestre;
    }

    public void setSemestre(String semestre) {
        this.semestre = semestre;
    }
}
