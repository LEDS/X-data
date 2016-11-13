package br.edu.ifes.leds.xdata.br.edu.ifes.leds.application;

import br.edu.ifes.leds.xdata.cgt.AplCriarXML;

import java.io.IOException;

/**
 * Created by paulosantosjunior on 08/11/16.
 */
public class Application {

    public  static void main (String[] xx){

        AplCriarXML aplCriarXML = new AplCriarXML();
        try {

            aplCriarXML.criarXML("/Users/paulosantosjunior/Documents/Serra_1_3.csv",
                    "/Users/paulosantosjunior/Documents/Serra_1_2.xml");

            System.out.println("Feito");

        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
