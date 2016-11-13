package br.edu.ifes.leds.xdata.util;

import br.edu.ifes.leds.xdata.cdp.Documento;
import com.thoughtworks.xstream.XStream;

import java.io.File;
import java.io.FileWriter;

/**
 * Created by paulosantosjunior on 08/11/16.
 */
public class XDataBuilder {


    private XStream xstream = new XStream();

    /** Funcao responsável por criar a string que contem o xml do arquivo a ser lido**/
    public void criarXML(Documento documento, String caminhoXML) throws Exception{

        xstream.autodetectAnnotations(true);

        File file;
        file = new File(caminhoXML);

        xstream.toXML(documento,new FileWriter(file));

    }
}
