/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Report;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.view.JasperViewer;
 
/**
 *
 *
 */
public class Report {
 
    public static Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
 
    private Report() {
    }
 
    ;
    public static Report getInstance() {
        return new Report();
    }
    String reportDir = ("C:/report/");
//      {
//          File f = new File("lib/report.txt");
//        try {
//            BufferedReader bfr=new BufferedReader(new FileReader(f));
//            try {
//                reportDir= bfr.readLine();
//            } catch (IOException ex) {
//                Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        } catch (FileNotFoundException ex) {
//            Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
//        }
////          System.out.println(reportDir);
//        //  "D:\\wamp\\ex\\";
//      }
 
    public void generateReport(String reportname, Map param, boolean view) {
        try {
 
            JasperReport jr = JasperCompileManager.compileReport(reportDir + reportname);
            JasperPrint jp = JasperFillManager.fillReport(jr, param);
 
            if (view == true) {
                JasperViewer viewer = new JasperViewer(jp, false);
                viewer.setLocation(0, 1);
                viewer.setSize(screenSize);
//                viewer.pack();
                viewer.requestFocus();
                viewer.setVisible(true);
//                viewer.setAlwaysOnTop(true);
 
//                final JRPrintServiceExporter exporter = new JRPrintServiceExporter();
//
//                exporter.setParameter(JRExporterParameter.JASPER_PRINT, jp);
//                exporter.setParameter(JRPrintServiceExporterParameter.DISPLAY_PAGE_DIALOG, Boolean.FALSE);
//                exporter.setParameter(JRPrintServiceExporterParameter.DISPLAY_PRINT_DIALOG, Boolean.TRUE);
//                exporter.exportReport();
//            JasperViewer.viewReport(jp, false);
//                JasperPrintManager.printReport(jp, true);
            } else {
                JasperViewer.viewReport(jp, false);
                //  JasperExportManager.exportReportToPdfFile(jp, "reports/simple_report.pdf");
            }
        } catch (JRException ex) {
            Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, ex);
        }
    }
}