/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

/**
 *
 * @author USUARIO
 */
/*
 * Copyright (C) 2001-2004 Colin Bell
 * colbell@users.sourceforge.net
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */


import java.awt.Component;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.FontMetrics;
import java.awt.Frame;
import java.awt.GraphicsConfiguration;
import java.awt.GraphicsDevice;
import java.awt.GraphicsEnvironment;
import java.awt.Insets;
import java.awt.Point;
import java.awt.Rectangle;
import java.awt.Toolkit;
import java.awt.Window;
import java.awt.geom.Rectangle2D;
import java.beans.PropertyVetoException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JInternalFrame;
import javax.swing.SwingUtilities;

/**
 * Common GUI utilities accessed via static methods.
 * 
 * @author <A HREF="mailto:colbell@users.sourceforge.net">Colin Bell</A>
 */
public class GUIUtils {


  /**
   * Return <TT>true</TT> if <TT>frame</TT> is a tool window. I.E. is the
   * <TT>JInternalFrame.isPalette</TT> set to <TT>Boolean.TRUE</TT>?
   * 
   * @param frame
   *          The <TT>JInternalFrame</TT> to be checked.
   * 
   * @throws IllegalArgumentException
   *           If <TT>frame</TT> is <TT>null</TT>.
   */
  public static boolean isToolWindow(JInternalFrame frame) {
    if (frame == null) {
      throw new IllegalArgumentException("null JInternalFrame passed");
    }

    final Object obj = frame.getClientProperty("JInternalFrame.isPalette");
    return obj != null && obj == Boolean.TRUE;
  }

  /**
   * Make the passed internal frame a Tool Window.
   */
  public static void makeToolWindow(JInternalFrame frame, boolean isToolWindow) {
    if (frame == null) {
      throw new IllegalArgumentException("null JInternalFrame passed");
    }
    frame
        .putClientProperty("JInternalFrame.isPalette", isToolWindow ? Boolean.TRUE : Boolean.FALSE);
  }
}
