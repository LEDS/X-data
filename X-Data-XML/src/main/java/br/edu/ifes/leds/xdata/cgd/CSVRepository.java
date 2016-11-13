package br.edu.ifes.leds.xdata.cgd;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

/**
 * Created by paulosantosjunior on 08/11/16.
 */
public class CSVRepository {

    public Iterable<CSVRecord> ler (String path) throws FileNotFoundException, IOException {

        Reader arquivo = new FileReader(path);

        CSVFormat excel = CSVFormat.EXCEL;

        excel = excel.withFirstRecordAsHeader();

        excel = excel.withDelimiter(';');

        Iterable<CSVRecord> records = excel.parse(arquivo);

        return records;

    }
}
