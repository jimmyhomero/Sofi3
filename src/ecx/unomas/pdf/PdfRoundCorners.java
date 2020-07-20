package ecx.unomas.pdf;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.GrayColor;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPCellEvent;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfShading;
import com.itextpdf.text.pdf.PdfShadingPattern;
import com.itextpdf.text.pdf.PdfWriter;

public class PdfRoundCorners implements PdfPCellEvent {

    private PdfWriter writer;

    private BaseColor[] colorFill;
    private boolean topLeft;
    private boolean topRight;
    private boolean bottomRight;
    private boolean bottomLeft;

    /**
     * Create a new PdfRoundCorners event while specifying a single fill color
     * and which corners will be rounded.
     *
     * @param colorFill The BaseColor to use as the fill color.
     * @param topLeft If true, top left corner will be rounded.
     * @param topRight If true, top right corner will be rounded.
     * @param bottomRight If true, bottom right corner will be rounded.
     * @param bottomLeft If true, bottom left corner will be rounded.
     */
    public PdfRoundCorners( BaseColor colorFill, boolean topLeft, boolean topRight, boolean bottomRight, boolean bottomLeft){
        this.colorFill = new BaseColor[]{ colorFill };
        this.topLeft = topLeft;
        this.topRight = topRight;
        this.bottomRight = bottomRight;
        this.bottomLeft = bottomLeft;
    }

    /**
     * Create a new PdfRoundCorners event while specifying a vertical background
     * gradient and which corners will be rounded.
     *
     * @param writer The PdfWriter instance for the PDF document which is used
     * for creating gradients.
     * @param colorFill An array of two BaseColors which will be used to create
     * the gradient.
     * @param topLeft If true, top left corner will be rounded.
     * @param topRight If true, top right corner will be rounded.
     * @param bottomRight If true, bottom right corner will be rounded.
     * @param bottomLeft If true, bottom left corner will be rounded.
     */
    public PdfRoundCorners(
            PdfWriter writer,
            BaseColor[] colorFill,
            boolean topLeft,
            boolean topRight,
            boolean bottomRight,
            boolean bottomLeft) {
        this.writer = writer;
        this.colorFill = colorFill;
        this.topLeft = topLeft;
        this.topRight = topRight;
        this.bottomRight = bottomRight;
        this.bottomLeft = bottomLeft;
    }

    /**
     * Interface method for drawing the background fill pattern.
     */
    @Override
    public void cellLayout(PdfPCell cell, Rectangle rect, PdfContentByte[] canvas) {
        // Get the cell's background canvas
        PdfContentByte cb = canvas[PdfPTable.BACKGROUNDCANVAS];
        
        cb.setColorStroke(new GrayColor(0.8f));
        cb.stroke();
        
        // Adjust left and right positions to fix visible gaps
        float left = rect.getLeft() - (PdfStyle.CELL_BORDER_WIDTH / 2);
        float top = rect.getTop();
        float right = rect.getRight() + (PdfStyle.CELL_BORDER_WIDTH / 2);
        float bottom = rect.getBottom();

        // Set the fill color or gradient
        if(colorFill.length < 2) {
            cb.setColorFill(colorFill[0]);
        } else {
            PdfShading shading = PdfShading.simpleAxial(
                    writer, left, top, left, bottom, colorFill[0], colorFill[1]);
            PdfShadingPattern shadingPattern = new PdfShadingPattern(shading);
            cb.setShadingFill(shadingPattern);
        }

        // Define the background box including rounded corners
        if(topLeft) {
            cb.moveTo(left, top - PdfStyle.CELL_CORNER_RADIUS);
            cb.curveTo(left, top, left + PdfStyle.CELL_CORNER_RADIUS, top);
        } else cb.moveTo(left, top);

        if(topRight) {
            cb.lineTo(right - PdfStyle.CELL_CORNER_RADIUS, top);
            cb.curveTo(right, top, right, top - PdfStyle.CELL_CORNER_RADIUS);
        } else cb.lineTo(right, top);

        if(bottomRight) {
            cb.lineTo(right, bottom + PdfStyle.CELL_CORNER_RADIUS);
            cb.curveTo(right, bottom, right - PdfStyle.CELL_CORNER_RADIUS, bottom);
        } else cb.lineTo(right, bottom);

        if(bottomLeft) {
            cb.lineTo(left + PdfStyle.CELL_CORNER_RADIUS, bottom);
            cb.curveTo(left, bottom, left, bottom + PdfStyle.CELL_CORNER_RADIUS);
        } else cb.lineTo(left, bottom);

        if(topLeft) cb.lineTo(left, top - PdfStyle.CELL_CORNER_RADIUS);
        else cb.lineTo(left, top);

        cb.closePath();

        // Fill it up!
        cb.fill();
    }

}