package br.edu.ifes.leds.xdata.cgd;

import br.edu.ifes.leds.xdata.cdp.Documento;
import br.edu.ifes.leds.xdata.util.XDataBuilder;

/**
 * Created by paulosantosjunior on 08/11/16.
 */
public class XMLRepository {

    public void criarArquivo (Documento documento, String caminhoArquivo) throws Exception {

        XDataBuilder xDataBuilder = new XDataBuilder();
        xDataBuilder.criarXML(documento,caminhoArquivo);


    }
}
