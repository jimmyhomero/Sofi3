package ec.unomas.pdf;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;


public class PdfStyle {
    public static final Font TABLE_CAPTION_FONT = new Font(FontFamily.HELVETICA, 7, Font.BOLD);

    public static final BaseColor[] TABLE_CAPTION_COLORS = new BaseColor[]{
        new BaseColor(0xC9, 0xD2, 0xE7),
        new BaseColor(0xE8, 0xEC, 0xF5)
    };

    public static final float CELL_CORNER_RADIUS = 4;
    public static final BaseColor CELL_BORDER_COLOR = new BaseColor(0xCC, 0xCC, 0xCC);
    public static final float CELL_BORDER_WIDTH = 0.75f;
    
    public static final Font TABLE_H1_FONT = new Font(FontFamily.HELVETICA, 12, Font.BOLD);
    public static final Font TABLE_H2_FONT = new Font(FontFamily.HELVETICA, 10, Font.BOLD);
    public static final Font TABLE_H3_FONT = new Font(FontFamily.HELVETICA, 9, Font.BOLD);
    public static final Font TABLE_P_FONT = new Font(FontFamily.HELVETICA, 8, Font.NORMAL);
    public static final Font BOLD_FONT = new Font(FontFamily.HELVETICA, 7, Font.BOLD);
    public static final Font P_FONT = new Font(FontFamily.HELVETICA, 7, Font.NORMAL);
    
    public static final Font P_FONT7 = new Font(FontFamily.HELVETICA, 7, Font.NORMAL);
    public static final Font BOLD_FONT6 = new Font(FontFamily.HELVETICA, 6, Font.BOLD);
}
