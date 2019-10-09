/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesAuxiliares;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.schmizz.sshj.SSHClient;
import net.schmizz.sshj.connection.channel.direct.Session;
import net.schmizz.sshj.connection.channel.direct.Session.Command;

/**
 *
 * @author USUARIO
 */
public class SshUpdate {

    public static void UploadUpdate() {

        SSHClient ssh = new SSHClient();
        try {
            ssh.loadKnownHosts();
            ssh.connect("compueconomia.com.ec");
            ssh.authPublickey("userId");
            Session session = ssh.startSession();
            Command cmd = session.exec("yourCommand");
            System.out.println(cmd.getOutputStream());
            session.close();
            ssh.disconnect();
        } catch (IOException ex) {
            Logger.getLogger(SshUpdate.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
