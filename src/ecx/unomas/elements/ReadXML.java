package ecx.unomas.elements;

import ecx.unomas.factura.Factura;
import ecx.unomas.factura.Pago;
import ecx.unomas.factura.TotalImpuesto;
import ecx.unomas.factura.Detalle;
import ecx.unomas.factura.Impuesto;
import ecx.unomas.guiaremision.GuiaRemision;
import ecx.unomas.guiaremision.Destinatarios;
import ecx.unomas.notacredito.NotaCredito;
import ecx.unomas.notadebito.NotaDebito;
import ecx.unomas.retencion.Retencion;
import java.io.IOException;
import java.util.Vector;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class ReadXML {
    //originalmente era asi 
    //public Factura readFactura(Document doc) throws TagNotFoundException, ParserConfigurationException, SAXException, IOException{

    public Factura readFactura(Document doc) {
        Factura factura = new Factura();
        // INFO TRIBUTARIA
        NodeList infoTributariaTag = doc.getElementsByTagName("infoTributaria");
        Element infoTributaria = (Element) infoTributariaTag.item(0);
        Element infoTributariaElements = (Element) infoTributaria;

        try {
            NodeList ambienteTag = infoTributariaElements.getElementsByTagName("ambiente");
            Element ambienteElement = (Element) ambienteTag.item(0);
            NodeList ambiente = ambienteElement.getChildNodes();
            factura.setAmbiente(Integer.parseInt(((Node) ambiente.item(0)).getNodeValue()));
        } catch (Exception e) {
            System.out.println("Falta ambiente");
        }

        try {
            NodeList timpoEmisionTag = infoTributariaElements.getElementsByTagName("tipoEmision");
            Element timpoEmisionElement = (Element) timpoEmisionTag.item(0);
            NodeList tipoEmision = timpoEmisionElement.getChildNodes();
            factura.setTipoEmision(Integer.parseInt(((Node) tipoEmision.item(0)).getNodeValue()));
        } catch (Exception e) {

            System.out.println("Falta tipoEmision");
        }

        try {
            NodeList razonSocialTag = infoTributariaElements.getElementsByTagName("razonSocial");
            Element razonSocialElement = (Element) razonSocialTag.item(0);
            NodeList razonSocial = razonSocialElement.getChildNodes();
            factura.setRazonSocial(removeAccents(((Node) razonSocial.item(0)).getNodeValue().trim().toLowerCase()));
        } catch (Exception e) {

            System.out.println("Falta razonSocial");
            System.out.println("");
        }

        try {
            System.out.println("ecx.unomas.elements.ReadXML.readFactura()");
            NodeList nombreComercialTag = infoTributariaElements.getElementsByTagName("nombreComercial");
            System.out.println("Falta nombreComercial");
            System.out.println(nombreComercialTag);
            Element nombreComercialElement = (Element) nombreComercialTag.item(0);
            NodeList nombreComercial = nombreComercialElement.getChildNodes();
            factura.setNombreComercial(removeAccents(((Node) nombreComercial.item(0)).getNodeValue().trim().toLowerCase()));
        } catch (Exception e) {
            System.out.println("ecx.unomas.elements.ReadXML.readFactura(): " + e);
            System.out.println("Falta nombreComercial");
        }

        try {
            NodeList rucTag = infoTributariaElements.getElementsByTagName("ruc");
            Element rucElement = (Element) rucTag.item(0);
            NodeList ruc = rucElement.getChildNodes();
            factura.setRUC(((Node) ruc.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta ruc");
        }

        try {
            NodeList claveAccesoTag = infoTributariaElements.getElementsByTagName("claveAcceso");
            Element claveAccesoElement = (Element) claveAccesoTag.item(0);
            NodeList claveAcceso = claveAccesoElement.getChildNodes();
            factura.setClaveAcceso(((Node) claveAcceso.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta claveAcceso");
        }

        try {
            NodeList codDocTag = infoTributariaElements.getElementsByTagName("codDoc");
            Element codDocElement = (Element) codDocTag.item(0);
            NodeList codDoc = codDocElement.getChildNodes();
            factura.setCodDoc(((Node) codDoc.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta codDoc");
        }

        try {
            NodeList estabTag = infoTributariaElements.getElementsByTagName("estab");
            Element estabElement = (Element) estabTag.item(0);
            NodeList estab = estabElement.getChildNodes();
            factura.setEstab(((Node) estab.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta estab");
        }

        try {
            NodeList ptoEmiTag = infoTributariaElements.getElementsByTagName("ptoEmi");
            Element ptoEmiElement = (Element) ptoEmiTag.item(0);
            NodeList ptoEmi = ptoEmiElement.getChildNodes();
            factura.setPtoEmi(((Node) ptoEmi.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta ptoEmi");
        }

        try {
            NodeList secuencialTag = infoTributariaElements.getElementsByTagName("secuencial");
            Element secuencialElement = (Element) secuencialTag.item(0);
            NodeList secuencial = secuencialElement.getChildNodes();
            factura.setSecuencia(((Node) secuencial.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta secuencial");
        }

        try {
            NodeList dirMatrizTag = infoTributariaElements.getElementsByTagName("dirMatriz");
            Element dirMatrizElement = (Element) dirMatrizTag.item(0);
            NodeList dirMatriz = dirMatrizElement.getChildNodes();
            factura.setDirMatriz(removeAccents(((Node) dirMatriz.item(0)).getNodeValue().trim().toLowerCase()));
        } catch (Exception e) {
            System.out.println("Falta dirMatriz");
        }

        // INFO FACTURA
        NodeList infoFacturaTag = doc.getElementsByTagName("infoFactura");
        Element infoFactura = (Element) infoFacturaTag.item(0);
        Element infoFacturaElements = (Element) infoFactura;

        try {
            NodeList fechaEmisionTag = infoFacturaElements.getElementsByTagName("fechaEmision");
            Element fechaEmisionElement = (Element) fechaEmisionTag.item(0);
            NodeList fechaEmision = fechaEmisionElement.getChildNodes();
            factura.setFechaEmision(((Node) fechaEmision.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta fechaEmision");
        }

        try {
            NodeList dirEstablecimientoTag = infoFacturaElements.getElementsByTagName("dirEstablecimiento");
            Element dirEstablecimientoElement = (Element) dirEstablecimientoTag.item(0);
            NodeList dirEstablecimiento = dirEstablecimientoElement.getChildNodes();
            factura.setDirEstablecimiento(removeAccents(((Node) dirEstablecimiento.item(0)).getNodeValue().trim().toLowerCase()));
        } catch (Exception e) {
            System.out.println("Falta dirEstablecimiento");
        }

        try {
            NodeList contribuyenteEspecialTag = infoFacturaElements.getElementsByTagName("contribuyenteEspecial");
            Element contribuyenteEspecialElement = (Element) contribuyenteEspecialTag.item(0);
            NodeList contribuyenteEspecial = contribuyenteEspecialElement.getChildNodes();
            factura.setContribuyenteEspecial(((Node) contribuyenteEspecial.item(0)).getNodeValue());
        } catch (Exception e) {
        }

        try {
            NodeList obligadoContabilidadTag = infoFacturaElements.getElementsByTagName("obligadoContabilidad");
            Element obligadoContabilidadElement = (Element) obligadoContabilidadTag.item(0);
            NodeList obligadoContabilidad = obligadoContabilidadElement.getChildNodes();
            factura.setObligadoContabilidad(((Node) obligadoContabilidad.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta obligadoContabilidad");
        }

        try {
            NodeList comercioExteriorTag = infoFacturaElements.getElementsByTagName("comercioExterior");
            Element comercioExteriorElement = (Element) comercioExteriorTag.item(0);
            NodeList comercioExterior = comercioExteriorElement.getChildNodes();
            factura.setComercioExterior(((Node) comercioExterior.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta comercio exterior");
        }

        try {
            NodeList incoTermFacturaTag = infoFacturaElements.getElementsByTagName("incoTermFactura");
            Element incoTermFacturaElement = (Element) incoTermFacturaTag.item(0);
            NodeList incoTermFactura = incoTermFacturaElement.getChildNodes();
            factura.setIncoTermFactura(((Node) incoTermFactura.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta incoTermFactura");
        }

        try {
            NodeList lugarIncoTermTag = infoFacturaElements.getElementsByTagName("lugarIncoTerm");
            Element lugarIncoTermElement = (Element) lugarIncoTermTag.item(0);
            NodeList lugarIncoTerm = lugarIncoTermElement.getChildNodes();
            factura.setLugarIncoTerm(((Node) lugarIncoTerm.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta lugarIncoTerm");
        }

        try {
            NodeList paisOrigenTag = infoFacturaElements.getElementsByTagName("paisOrigen");
            Element paisOrigenElement = (Element) paisOrigenTag.item(0);
            NodeList paisOrigen = paisOrigenElement.getChildNodes();
            factura.setPaisOrigen(Integer.parseInt(((Node) paisOrigen.item(0)).getNodeValue()));
        } catch (Exception e) {
            System.out.println("Falta paisOrigen");
        }

        try {
            NodeList puertoEmbarqueTag = infoFacturaElements.getElementsByTagName("puertoEmbarque");
            Element puertoEmbarqueElement = (Element) puertoEmbarqueTag.item(0);
            NodeList puertoEmbarque = puertoEmbarqueElement.getChildNodes();
            factura.setPuertoEmbarque(((Node) puertoEmbarque.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta puertoEmbarque");
        }

        try {
            NodeList puertoDestinoTag = infoFacturaElements.getElementsByTagName("puertoDestino");
            Element puertoDestinoElement = (Element) puertoDestinoTag.item(0);
            NodeList puertoDestino = puertoDestinoElement.getChildNodes();
            factura.setPuertoDestino(((Node) puertoDestino.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta puertoDestino");
        }

        try {
            NodeList paisDestinoTag = infoFacturaElements.getElementsByTagName("paisDestino");
            Element paisDestinoElement = (Element) paisDestinoTag.item(0);
            NodeList paisDestino = paisDestinoElement.getChildNodes();
            factura.setPaisDestino(Integer.parseInt(((Node) paisDestino.item(0)).getNodeValue()));
        } catch (Exception e) {
            System.out.println("Falta paisDestino");
        }

        try {
            NodeList paisAduisicionTag = infoFacturaElements.getElementsByTagName("paisAdquisicion");
            Element paisAdquisicionElement = (Element) paisAduisicionTag.item(0);
            NodeList paisAdquisicion = paisAdquisicionElement.getChildNodes();
            factura.setPaisAdquisicion(Integer.parseInt(((Node) paisAdquisicion.item(0)).getNodeValue()));
        } catch (Exception e) {
            System.out.println("Falta paisAdquisicion");
        }

        try {
            NodeList tipoIdentificacionCompradorTag = infoFacturaElements.getElementsByTagName("tipoIdentificacionComprador");
            Element tipoIdentificacionCompradorElement = (Element) tipoIdentificacionCompradorTag.item(0);
            NodeList tipoIdentificacionComprador = tipoIdentificacionCompradorElement.getChildNodes();
            factura.setTipoIdentificacionComprador(((Node) tipoIdentificacionComprador.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta tipoIdentificacionComprador");
        }
        try {
            NodeList guiaRemisionTag = infoFacturaElements.getElementsByTagName("guiaRemision");
            Element guiaRemisionElement = (Element) guiaRemisionTag.item(0);
            NodeList guiaRemision = guiaRemisionElement.getChildNodes();
            factura.setGuiaRemision(((Node) guiaRemision.item(0)).getNodeValue());
        } catch (NullPointerException e) {
        }

        try {
            NodeList razonSocialCompradorTag = infoFacturaElements.getElementsByTagName("razonSocialComprador");
            Element razonSocialCompradorElement = (Element) razonSocialCompradorTag.item(0);
            NodeList razonSocialComprador = razonSocialCompradorElement.getChildNodes();
            factura.setRazonSocialComprador(removeAccents(((Node) razonSocialComprador.item(0)).getNodeValue().trim().toLowerCase()));
        } catch (Exception e) {
            System.out.println("Falta razonSocialComprador");
        }

        try {
            NodeList identificacionCompradorTag = infoFacturaElements.getElementsByTagName("identificacionComprador");
            Element identificacionCompradorElement = (Element) identificacionCompradorTag.item(0);
            NodeList identificacionComprador = identificacionCompradorElement.getChildNodes();
            factura.setIdentificacionComprador(((Node) identificacionComprador.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta identificacionComprador");
        }

        try {
            NodeList dirCompradorTag = infoFacturaElements.getElementsByTagName("direccionComprador");
            Element dirCompradorElement = (Element) dirCompradorTag.item(0);
            NodeList dirComprador = dirCompradorElement.getChildNodes();
            factura.setDireccionComprador(((Node) dirComprador.item(0)).getNodeValue());
        } catch (Exception e) {
        }

        try {
            NodeList totalSinImpuestosTag = infoFacturaElements.getElementsByTagName("totalSinImpuestos");
            Element totalSinImpuestosElement = (Element) totalSinImpuestosTag.item(0);
            NodeList totalSinImpuestos = totalSinImpuestosElement.getChildNodes();
            factura.setTotalSinImpuestos(Double.parseDouble(((Node) totalSinImpuestos.item(0)).getNodeValue().replace(",", "")));
        } catch (Exception e) {
            System.out.println("Falta totalSinImpuestos");
        }

        try {
            NodeList incoTermTotalSinImpuestosTag = infoFacturaElements.getElementsByTagName("incoTermTotalSinImpuestos");
            Element incoTermTotalSinImpuestosElement = (Element) incoTermTotalSinImpuestosTag.item(0);
            NodeList incoTermTotalSinImpuestos = incoTermTotalSinImpuestosElement.getChildNodes();
            factura.setIncoTermTotalSinImpuestos(((Node) incoTermTotalSinImpuestos.item(0)).getNodeValue());
        } catch (Exception e) {

        }

        try {
            NodeList totalDescuentoTag = infoFacturaElements.getElementsByTagName("totalDescuento");
            Element totalDescuentoElement = (Element) totalDescuentoTag.item(0);
            NodeList totalDescuento = totalDescuentoElement.getChildNodes();
            factura.setTotalDescuento(Double.parseDouble(((Node) totalDescuento.item(0)).getNodeValue().replace(",", "")));
        } catch (Exception e) {
            System.out.println("Falta el total de descuento");
        }

        // TOTAL CON IMPUESTOS
        NodeList totalConImpuestosTag = doc.getElementsByTagName("totalConImpuestos");
        Element totalConImpuestos = (Element) totalConImpuestosTag.item(0);
        Element totalConImpuestosElements = (Element) totalConImpuestos;

        NodeList totalImpuestoTags = totalConImpuestosElements.getElementsByTagName("totalImpuesto");
        for (int ti = 0; ti < totalImpuestoTags.getLength(); ti++) {
            TotalImpuesto totalImpuesto = new TotalImpuesto();
            Node impuesto = totalImpuestoTags.item(ti);
            if (impuesto.getNodeType() == Node.ELEMENT_NODE) {
                Element impuestoElement = (Element) impuesto;

                try {
                    NodeList codigoTag = impuestoElement.getElementsByTagName("codigo");
                    Element codigoElement = (Element) codigoTag.item(0);
                    NodeList codigo = codigoElement.getChildNodes();
                    totalImpuesto.setCodigo(Integer.parseInt(((Node) codigo.item(0)).getNodeValue()));
                } catch (Exception e) {
                    System.out.println("Falta el codigo (total impuestos)");
                }

                try {
                    NodeList codigoPorcentajeTag = impuestoElement.getElementsByTagName("codigoPorcentaje");
                    Element codigoPorcentajeElement = (Element) codigoPorcentajeTag.item(0);
                    NodeList codigoPorcentaje = codigoPorcentajeElement.getChildNodes();
                    totalImpuesto.setCodigoPorcentaje(Integer.parseInt(((Node) codigoPorcentaje.item(0)).getNodeValue()));
                } catch (Exception e) {
                    System.out.println("Falta el codigo de porcentaje (total impuestos)");
                }

                try {
                    NodeList baseImponibleTag = impuestoElement.getElementsByTagName("baseImponible");
                    Element baseImponibleElement = (Element) baseImponibleTag.item(0);
                    NodeList baseImponible = baseImponibleElement.getChildNodes();
                    totalImpuesto.setBaseImponible(Double.parseDouble(((Node) baseImponible.item(0)).getNodeValue().replace(",", "")));
                } catch (Exception e) {
                    System.out.println("Falta la base imponible");
                }

                try {
                    NodeList valorTag = impuestoElement.getElementsByTagName("valor");
                    Element valorElement = (Element) valorTag.item(0);
                    NodeList valor = valorElement.getChildNodes();
                    totalImpuesto.setValor(Double.parseDouble(((Node) valor.item(0)).getNodeValue().replace(",", "")));
                } catch (Exception e) {
                    System.out.println("Falta el valor");
                }
            }
            factura.setTotalImpuestos(totalImpuesto);
        }

        try {
            NodeList propinaTag = infoFacturaElements.getElementsByTagName("propina");
            Element propinaElement = (Element) propinaTag.item(0);
            NodeList propina = propinaElement.getChildNodes();
            factura.setPropina(Double.parseDouble(((Node) propina.item(0)).getNodeValue().replace(",", "")));
        } catch (Exception e) {
            System.out.println("Falta la propina");
        }

        try {
            NodeList fleteInternacionalTag = infoFacturaElements.getElementsByTagName("fleteInternacional");
            Element fleteInternacionalElement = (Element) fleteInternacionalTag.item(0);
            NodeList fleteInternacional = fleteInternacionalElement.getChildNodes();
            factura.setFleteInternacional(Double.parseDouble(((Node) fleteInternacional.item(0)).getNodeValue().replace(",", "")));
        } catch (Exception e) {
            System.out.println("Falta fleteInternacional");
        }

        try {
            NodeList seguroInternacionalTag = infoFacturaElements.getElementsByTagName("seguroInternacional");
            Element seguroInternacionalElement = (Element) seguroInternacionalTag.item(0);
            NodeList seguroInternacional = seguroInternacionalElement.getChildNodes();
            factura.setSeguroInternacional(Double.parseDouble(((Node) seguroInternacional.item(0)).getNodeValue().replace(",", "")));
        } catch (Exception e) {
            System.out.println("Falta seguroInternacional");
        }

        try {
            NodeList gastosAduanerosTag = infoFacturaElements.getElementsByTagName("gastosAduaneros");
            Element gastosAduanerosElement = (Element) gastosAduanerosTag.item(0);
            NodeList gastosAduaneros = gastosAduanerosElement.getChildNodes();
            factura.setGastosAduaneros(Double.parseDouble(((Node) gastosAduaneros.item(0)).getNodeValue().replace(",", "")));
        } catch (Exception e) {
            System.out.println("Falta gastosAduaneros");
        }

        try {
            NodeList gastosTransporteOtrosTag = infoFacturaElements.getElementsByTagName("gastosTransporteOtros");
            Element gastosTransporteOtrosElement = (Element) gastosTransporteOtrosTag.item(0);
            NodeList gastosTransporteOtros = gastosTransporteOtrosElement.getChildNodes();
            factura.setGastosTransporteOtros(Double.parseDouble(((Node) gastosTransporteOtros.item(0)).getNodeValue().replace(",", "")));
        } catch (Exception e) {
            System.out.println("Falta gastosTransporteOtros");
        }

        try {
            NodeList importeTotalTag = infoFacturaElements.getElementsByTagName("importeTotal");
            Element importeTotalElement = (Element) importeTotalTag.item(0);
            NodeList importeTotal = importeTotalElement.getChildNodes();
            factura.setImporteTotal(Double.parseDouble(((Node) importeTotal.item(0)).getNodeValue().replace(",", "")));
        } catch (Exception e) {
            System.out.println("Falta el importe total");
        }

        try {
            NodeList monedaTag = infoFacturaElements.getElementsByTagName("moneda");
            Element monedaElement = (Element) monedaTag.item(0);
            NodeList moneda = monedaElement.getChildNodes();
            factura.setMoneda(((Node) moneda.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta la moneda");
        }

        // PAGOS
        try {
            Vector<Pago> pagos = new Vector<Pago>();
            NodeList pagosTag = infoFacturaElements.getElementsByTagName("pagos");
            Element pagosElements = (Element) pagosTag.item(0);

            NodeList pagoTags = pagosElements.getElementsByTagName("pago");
            for (int ti = 0; ti < pagoTags.getLength(); ti++) {
                Pago pago = new Pago();
                Node pagoNode = pagoTags.item(ti);
                if (pagoNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element pagoElement = (Element) pagoNode;

                    try {
                        NodeList formaPagoTag = pagoElement.getElementsByTagName("formaPago");
                        Element formaPagoElement = (Element) formaPagoTag.item(0);
                        NodeList formaPago = formaPagoElement.getChildNodes();
                        pago.setFormaPago(((Node) formaPago.item(0)).getNodeValue());
                    } catch (Exception e) {
                        System.out.println("Falta la forma de pago");
                    }

                    try {
                        NodeList totalTag = pagoElement.getElementsByTagName("total");
                        Element totalElement = (Element) totalTag.item(0);
                        NodeList total = totalElement.getChildNodes();
                        pago.setTotal(Double.parseDouble(((Node) total.item(0)).getNodeValue()));
                    } catch (Exception e) {
                        System.out.println("Falta el total");
                    }

                    try {
                        NodeList plazoTag = pagoElement.getElementsByTagName("plazo");
                        Element plazoElement = (Element) plazoTag.item(0);
                        NodeList plazo = plazoElement.getChildNodes();
                        pago.setPlazo(Integer.parseInt(((Node) plazo.item(0)).getNodeValue()));
                    } catch (Exception e) {
                        System.out.println("Falta el plazo");
                    }

                    try {
                        NodeList unidadTiempoTag = pagoElement.getElementsByTagName("unidadTiempo");
                        Element unidadTiempoElement = (Element) unidadTiempoTag.item(0);
                        NodeList unidadTiempo = unidadTiempoElement.getChildNodes();
                        pago.setUnidadTiempo(((Node) unidadTiempo.item(0)).getNodeValue());
                    } catch (Exception e) {
                        System.out.println("Falta la unidad de tiempo");
                    }
                }
                pagos.add(pago);
            }
            factura.setPagos(pagos);
        } catch (Exception e) {
        }

        // DETALLES
        NodeList detallesTag = doc.getElementsByTagName("detalles");
        Element detalles = (Element) detallesTag.item(0);
        Element detallesElements = (Element) detalles;

        NodeList detalleTags = detallesElements.getElementsByTagName("detalle");
        for (int d = 0; d < detalleTags.getLength(); d++) {
            Detalle factura_detalle = new Detalle();
            Node detalle = detalleTags.item(d);
            if (detalle.getNodeType() == Node.ELEMENT_NODE) {
                Element detalleElement = (Element) detalle;

                try {
                    NodeList codigoPrincipalTag = detalleElement.getElementsByTagName("codigoPrincipal");
                    Element codigoPrincipalElement = (Element) codigoPrincipalTag.item(0);
                    NodeList codigoPrincipal = codigoPrincipalElement.getChildNodes();
                    factura_detalle.setCodigoPrincipal(((Node) codigoPrincipal.item(0)).getNodeValue());
                } catch (Exception e) {
                    System.out.println("Falta el codigo principal");
                }

                try {
                    NodeList codigoAuxiliarTag = detalleElement.getElementsByTagName("codigoAuxiliar");
                    Element codigoAuxiliarElement = (Element) codigoAuxiliarTag.item(0);
                    NodeList codigoAuxiliar = codigoAuxiliarElement.getChildNodes();
                    factura_detalle.setCodigoSecundario(((Node) codigoAuxiliar.item(0)).getNodeValue());
                } catch (NullPointerException e) {
                    // sin codigo auxiliar
                }

                try {
                    NodeList descripcionTag = detalleElement.getElementsByTagName("descripcion");
                    Element descripcionElement = (Element) descripcionTag.item(0);
                    NodeList descripcion = descripcionElement.getChildNodes();
                    factura_detalle.setDescripcion(removeAccents(((Node) descripcion.item(0)).getNodeValue().trim().toLowerCase()));
                } catch (Exception e) {
                    System.out.println("Falta la descripcion");
                }

                try {
                    NodeList cantidadTag = detalleElement.getElementsByTagName("cantidad");
                    Element cantidadElement = (Element) cantidadTag.item(0);
                    NodeList cantidad = cantidadElement.getChildNodes();
                    factura_detalle.setCantidad(Double.parseDouble(((Node) cantidad.item(0)).getNodeValue().replace(",", "")));
                } catch (Exception e) {
                    System.out.println("Falta la cantidad");
                }

                try {
                    NodeList precioUnitarioTag = detalleElement.getElementsByTagName("precioUnitario");
                    Element precioUnitarioElement = (Element) precioUnitarioTag.item(0);
                    NodeList precioUnitario = precioUnitarioElement.getChildNodes();
                    factura_detalle.setPrecioUnitario(Double.parseDouble(((Node) precioUnitario.item(0)).getNodeValue().replace(",", "")));
                } catch (Exception e) {
                    System.out.println("Falta el precio unitario");
                }

                try {
                    NodeList descuentoTag = detalleElement.getElementsByTagName("descuento");
                    Element descuentoElement = (Element) descuentoTag.item(0);
                    NodeList descuento = descuentoElement.getChildNodes();
                    factura_detalle.setDescuento(Double.parseDouble(((Node) descuento.item(0)).getNodeValue().replace(",", "")));
                } catch (Exception e) {
                    System.out.println("Falta el descuento");
                }

                try {
                    NodeList precioTotalSinImpuestoTag = detalleElement.getElementsByTagName("precioTotalSinImpuesto");
                    Element precioTotalSinImpuestoElement = (Element) precioTotalSinImpuestoTag.item(0);
                    NodeList precioTotalSinImpuesto = precioTotalSinImpuestoElement.getChildNodes();
                    factura_detalle.setPrecioTotalSinImpuesto(Double.parseDouble(((Node) precioTotalSinImpuesto.item(0)).getNodeValue().replace(",", "")));
                } catch (Exception e) {
                    System.out.println("Falta el precio total sin impuestos");
                }

                try {
                    // DETALLES ADICIONALES
                    NodeList detallesAdicionalesTag = detalleElement.getElementsByTagName("detallesAdicionales");
                    Element detallesAdicionales = (Element) detallesAdicionalesTag.item(0);
                    Element detallesAdicionalesElements = (Element) detallesAdicionales;

                    NodeList detAdicionalTag = detallesAdicionalesElements.getElementsByTagName("detAdicional");
                    Vector<ecx.unomas.factura.DetAdicional> detAdicionales = new Vector<ecx.unomas.factura.DetAdicional>();
                    for (int da = 0; da < detAdicionalTag.getLength(); ++da) {
                        ecx.unomas.factura.DetAdicional factura_detAdicional = new ecx.unomas.factura.DetAdicional();
                        Node detAdicional = detAdicionalTag.item(da);
                        NamedNodeMap detAdicionalAttr = detAdicional.getAttributes();

                        Node nombre = detAdicionalAttr.getNamedItem("nombre");
                        factura_detAdicional.setNombre(removeAccents(nombre.getNodeValue().trim().toLowerCase()));

                        Node valor = detAdicionalAttr.getNamedItem("valor");
                        factura_detAdicional.setValor(valor.getNodeValue().trim());

                        detAdicionales.add(factura_detAdicional);
                    }
                    factura_detalle.setDetAdicional(detAdicionales);
                } catch (NullPointerException e) {
                    // no tiene detalles adicionales
                }
                // IMPUESTOS
                NodeList impuestosTag = detalleElement.getElementsByTagName("impuestos");
                Element impuestos = (Element) impuestosTag.item(0);
                Element impuestosElements = (Element) impuestos;
                boolean existeiva12 = false;
                NodeList detImpuestosTag = impuestosElements.getElementsByTagName("impuesto");
                Vector<ecx.unomas.factura.Impuesto> DetImpuestos = new Vector<ecx.unomas.factura.Impuesto>();
                for (int di = 0; di < detImpuestosTag.getLength(); di++) {
                    ecx.unomas.factura.Impuesto impuesto = new ecx.unomas.factura.Impuesto();
                    Node detImpuestos = detImpuestosTag.item(di);
                    if (detImpuestos.getNodeType() == Node.ELEMENT_NODE) {
                        Element detImpuestosElement = (Element) detImpuestos;

                        try {
                            NodeList codigoTag = detImpuestosElement.getElementsByTagName("codigo");
                            Element codigoElement = (Element) codigoTag.item(0);
                            NodeList codigo = codigoElement.getChildNodes();
                            impuesto.setCodigo(Integer.parseInt(((Node) codigo.item(0)).getNodeValue()));
                        } catch (Exception e) {
                            System.out.println("Falta el codigo (impuesto)");
                        }

                        try {
                            NodeList codigoPorcentajeTag = detImpuestosElement.getElementsByTagName("codigoPorcentaje");
                            Element codigoPorcentajeElement = (Element) codigoPorcentajeTag.item(0);
                            NodeList codigoPorcentaje = codigoPorcentajeElement.getChildNodes();
                            Integer codigoPorcentajeImpuesto = Integer.parseInt(String.valueOf(Math.round(Double.parseDouble(((Node) codigoPorcentaje.item(0)).getNodeValue().replace(",", ".")))));
                            impuesto.setCodigoPorcentaje(codigoPorcentajeImpuesto);
                            if (codigoPorcentajeImpuesto == 2) {
                                existeiva12 = true;
                            }
                        } catch (Exception e) {
                            System.out.println("Falta el codigo de porcentaje (impuesto)");
                        }

                        try {
                            NodeList tarifaTag = detImpuestosElement.getElementsByTagName("tarifa");
                            Element tarifaElement = (Element) tarifaTag.item(0);
                            NodeList tarifa = tarifaElement.getChildNodes();
                            impuesto.setTarifa(Double.parseDouble(((Node) tarifa.item(0)).getNodeValue().replace(",", "")));
                        } catch (Exception e) {
                            System.out.println("Falta la tarifa ");
                        }

                        try {
                            NodeList baseImponibleTag = detImpuestosElement.getElementsByTagName("baseImponible");
                            Element baseImponibleElement = (Element) baseImponibleTag.item(0);
                            NodeList baseImponible = baseImponibleElement.getChildNodes();
                            impuesto.setBaseImponible(Double.parseDouble(((Node) baseImponible.item(0)).getNodeValue().replace(",", "")));
                        } catch (Exception e) {
                            System.out.println("Falta la base imponible");
                        }

                        try {
                            NodeList valorTag = detImpuestosElement.getElementsByTagName("valor");
                            Element valorElement = (Element) valorTag.item(0);
                            NodeList valor = valorElement.getChildNodes();
                            impuesto.setValor(Double.parseDouble(((Node) valor.item(0)).getNodeValue().replace(",", "")));
                        } catch (Exception e) {
                            System.out.println("Falta el valor");
                        }
                    }

                    DetImpuestos.add(impuesto);
                }
                factura_detalle.setImpuesto(DetImpuestos);
            }
            factura.setDetalle(factura_detalle);
        }
        try {
            // INFO ADICIONAL
            NodeList infoAdicionalTag = doc.getElementsByTagName("infoAdicional");
            Element infoAdicional = (Element) infoAdicionalTag.item(0);
            Element infoAdicionalElements = (Element) infoAdicional;

            NodeList campoAdicionalTags = infoAdicionalElements.getElementsByTagName("campoAdicional");
            for (int ca = 0; ca < campoAdicionalTags.getLength(); ++ca) {
                ecx.unomas.factura.InfoAdicional factura_infoAdicional = new ecx.unomas.factura.InfoAdicional();
                Node campoAdicional = campoAdicionalTags.item(ca);
                NamedNodeMap campoAdicionalAttr = campoAdicional.getAttributes();

                Node nombre = campoAdicionalAttr.getNamedItem("nombre");
                factura_infoAdicional.setNombre(removeAccents(nombre.getNodeValue().trim().replace(" ", "").toLowerCase()));

                NodeList valor = campoAdicional.getChildNodes();
                factura_infoAdicional.setValor(removeAccents(((Node) valor.item(0)).getNodeValue().trim().toLowerCase()));

                factura.setInfAdicional(factura_infoAdicional);
            }
        } catch (NullPointerException e) {
            // no tiene informaci�n adicional
        }
        return factura;
    }

    public Retencion readRetencion(Document doc) {
        Retencion retencion = new Retencion();
        // INFO TRIBUTARIA
        NodeList infoTributariaTag = doc.getElementsByTagName("infoTributaria");
        Element infoTributaria = (Element) infoTributariaTag.item(0);
        Element infoTributariaElements = (Element) infoTributaria;

        try {
            NodeList ambienteTag = infoTributariaElements.getElementsByTagName("ambiente");
            Element ambienteElement = (Element) ambienteTag.item(0);
            NodeList ambiente = ambienteElement.getChildNodes();
            retencion.setAmbiente(Integer.parseInt(((Node) ambiente.item(0)).getNodeValue()));
        } catch (Exception e) {

            System.out.println("ec.unomas.elements.ReadXML.readRetencion(): Falta el ambiente " + e);
            System.out.println("Falta el ambiente");
        }

        try {
            NodeList timpoEmisionTag = infoTributariaElements.getElementsByTagName("tipoEmision");
            Element timpoEmisionElement = (Element) timpoEmisionTag.item(0);
            NodeList tipoEmision = timpoEmisionElement.getChildNodes();
            retencion.setTipoEmision(Integer.parseInt(((Node) tipoEmision.item(0)).getNodeValue()));
        } catch (Exception e) {
            System.out.println("Falta el tipo de emision");
        }

        try {
            NodeList razonSocialTag = infoTributariaElements.getElementsByTagName("razonSocial");
            Element razonSocialElement = (Element) razonSocialTag.item(0);
            NodeList razonSocial = razonSocialElement.getChildNodes();
            retencion.setRazonSocial(removeAccents(((Node) razonSocial.item(0)).getNodeValue().trim().toLowerCase()));
        } catch (Exception e) {
            System.out.println("Falta la razon social");
        }

        try {
            NodeList nombreComercialTag = infoTributariaElements.getElementsByTagName("nombreComercial");
            Element nombreComercialElement = (Element) nombreComercialTag.item(0);
            NodeList nombreComercial = nombreComercialElement.getChildNodes();
            retencion.setNombreComercial(removeAccents(((Node) nombreComercial.item(0)).getNodeValue().trim().toLowerCase()));
        } catch (Exception e) {
        }

        try {
            NodeList rucTag = infoTributariaElements.getElementsByTagName("ruc");
            Element rucElement = (Element) rucTag.item(0);
            NodeList ruc = rucElement.getChildNodes();
            retencion.setRUC(((Node) ruc.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta el RUC");
        }

        try {
            NodeList claveAccesoTag = infoTributariaElements.getElementsByTagName("claveAcceso");
            Element claveAccesoElement = (Element) claveAccesoTag.item(0);
            NodeList claveAcceso = claveAccesoElement.getChildNodes();
            retencion.setClaveAcceso(((Node) claveAcceso.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta la clave de acceso");
        }

        try {
            NodeList codDocTag = infoTributariaElements.getElementsByTagName("codDoc");
            Element codDocElement = (Element) codDocTag.item(0);
            NodeList codDoc = codDocElement.getChildNodes();
            retencion.setCodDoc(((Node) codDoc.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta el codigo de documento");
        }

        try {
            NodeList estabTag = infoTributariaElements.getElementsByTagName("estab");
            Element estabElement = (Element) estabTag.item(0);
            NodeList estab = estabElement.getChildNodes();
            retencion.setEstab(((Node) estab.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta el establecimiento");
        }

        try {
            NodeList ptoEmiTag = infoTributariaElements.getElementsByTagName("ptoEmi");
            Element ptoEmiElement = (Element) ptoEmiTag.item(0);
            NodeList ptoEmi = ptoEmiElement.getChildNodes();
            retencion.setPtoEmi(((Node) ptoEmi.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta el punto de emision");
        }

        try {
            NodeList secuencialTag = infoTributariaElements.getElementsByTagName("secuencial");
            Element secuencialElement = (Element) secuencialTag.item(0);
            NodeList secuencial = secuencialElement.getChildNodes();
            retencion.setSecuencia(((Node) secuencial.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta el secuencial");
        }

        try {
            NodeList dirMatrizTag = infoTributariaElements.getElementsByTagName("dirMatriz");
            Element dirMatrizElement = (Element) dirMatrizTag.item(0);
            NodeList dirMatriz = dirMatrizElement.getChildNodes();
            retencion.setDirMatriz(removeAccents(((Node) dirMatriz.item(0)).getNodeValue().trim().toLowerCase()));
        } catch (Exception e) {
            System.out.println("Falta el direccion matriz");
        }

        // INFO COMPROBANTE RETENCION
        NodeList infoCompRetencionTag = doc.getElementsByTagName("infoCompRetencion");
        Element infoCompRetencion = (Element) infoCompRetencionTag.item(0);
        Element infoCompRetencionElements = (Element) infoCompRetencion;

        try {
            NodeList fechaEmisionTag = infoCompRetencionElements.getElementsByTagName("fechaEmision");
            Element fechaEmisionElement = (Element) fechaEmisionTag.item(0);
            NodeList fechaEmision = fechaEmisionElement.getChildNodes();
            retencion.setFechaEmision(((Node) fechaEmision.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta la fecha de emision");
        }

        try {
            NodeList dirEstablecimientoTag = infoCompRetencionElements.getElementsByTagName("dirEstablecimiento");
            Element dirEstablecimientoElement = (Element) dirEstablecimientoTag.item(0);
            NodeList dirEstablecimiento = dirEstablecimientoElement.getChildNodes();
            retencion.setDirEstablecimiento(removeAccents(((Node) dirEstablecimiento.item(0)).getNodeValue().trim().toLowerCase()));
        } catch (Exception e) {
            System.out.println("Falta la direccion del establecimiento");
        }

        try {
            NodeList contribuyenteEspecialTag = infoCompRetencionElements.getElementsByTagName("contribuyenteEspecial");
            Element contribuyenteEspecialElement = (Element) contribuyenteEspecialTag.item(0);
            NodeList contribuyenteEspecial = contribuyenteEspecialElement.getChildNodes();
            retencion.setContribuyenteEspecial(((Node) contribuyenteEspecial.item(0)).getNodeValue());
        } catch (NullPointerException e) {

        }

        try {
            NodeList obligadoContabilidadTag = infoCompRetencionElements.getElementsByTagName("obligadoContabilidad");
            Element obligadoContabilidadElement = (Element) obligadoContabilidadTag.item(0);
            NodeList obligadoContabilidad = obligadoContabilidadElement.getChildNodes();
            retencion.setObligadoContabilidad(((Node) obligadoContabilidad.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta obligado a llevar contabilidad");
        }

        try {
            NodeList tipoIdentificacionSujetoRetenidoTag = infoCompRetencionElements.getElementsByTagName("tipoIdentificacionSujetoRetenido");
            Element tipoIdentificacionSujetoRetenidoElement = (Element) tipoIdentificacionSujetoRetenidoTag.item(0);
            NodeList tipoIdentificacionSujetoRetenido = tipoIdentificacionSujetoRetenidoElement.getChildNodes();
            retencion.setTipoIdentificacionSujetoRetenido(((Node) tipoIdentificacionSujetoRetenido.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta el tipo de identificacion del sujeto retenido");
        }

        try {
            NodeList razonSocialSujetoRetenidoTag = infoCompRetencionElements.getElementsByTagName("razonSocialSujetoRetenido");
            Element razonSocialSujetoRetenidoElement = (Element) razonSocialSujetoRetenidoTag.item(0);
            NodeList razonSocialSujetoRetenido = razonSocialSujetoRetenidoElement.getChildNodes();
            retencion.setRazonSocialSujetoRetenido(removeAccents(((Node) razonSocialSujetoRetenido.item(0)).getNodeValue().trim().toLowerCase()));
        } catch (Exception e) {
            System.out.println("Falta la razon social del sujeto retenido");
        }

        try {
            NodeList identificacionSujetoRetenidoTag = infoCompRetencionElements.getElementsByTagName("identificacionSujetoRetenido");
            Element identificacionSujetoRetenidoElement = (Element) identificacionSujetoRetenidoTag.item(0);
            NodeList identificacionSujetoRetenido = identificacionSujetoRetenidoElement.getChildNodes();
            retencion.setIdentificacionSujetoRetenido(((Node) identificacionSujetoRetenido.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta la identificacion del sujeto retenido");
        }

        try {
            NodeList periodoFiscalTag = infoCompRetencionElements.getElementsByTagName("periodoFiscal");
            Element periodoFiscalElement = (Element) periodoFiscalTag.item(0);
            NodeList periodoFiscal = periodoFiscalElement.getChildNodes();
            retencion.setPeriodoFiscal(((Node) periodoFiscal.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta el periodo fiscal");
        }

        // IMPUESTOS
        NodeList impuestosTag = doc.getElementsByTagName("impuestos");
        Element impuestos = (Element) impuestosTag.item(0);
        Element impuestosElements = (Element) impuestos;

        NodeList impuestoTags = impuestosElements.getElementsByTagName("impuesto");
        for (int d = 0; d < impuestoTags.getLength(); d++) {
            ecx.unomas.retencion.Impuesto retencion_impuestos = new ecx.unomas.retencion.Impuesto();
            Node impuesto = impuestoTags.item(d);
            if (impuesto.getNodeType() == Node.ELEMENT_NODE) {
                Element impuestoElement = (Element) impuesto;

                try {
                    NodeList codigoTag = impuestoElement.getElementsByTagName("codigo");
                    Element codigoElement = (Element) codigoTag.item(0);
                    NodeList codigo = codigoElement.getChildNodes();
                    retencion_impuestos.setCodigo(Integer.parseInt(((Node) codigo.item(0)).getNodeValue()));
                } catch (Exception e) {
                    System.out.println("Falta el codigo (impuesto)");
                }

                try {
                    NodeList codigoRetencionTag = impuestoElement.getElementsByTagName("codigoRetencion");
                    Element codigoRetencionElement = (Element) codigoRetencionTag.item(0);
                    NodeList codigoRetencion = codigoRetencionElement.getChildNodes();
                    retencion_impuestos.setCodigoRetencion(((Node) codigoRetencion.item(0)).getNodeValue());
                } catch (Exception e) {
                    System.out.println("Falta el codigo de retencion");
                }

                try {
                    NodeList baseImponibleTag = impuestoElement.getElementsByTagName("baseImponible");
                    Element baseImponibleElement = (Element) baseImponibleTag.item(0);
                    NodeList baseImponible = baseImponibleElement.getChildNodes();
                    retencion_impuestos.setBaseImponible(Double.parseDouble(((Node) baseImponible.item(0)).getNodeValue().replace(",", "")));
                } catch (Exception e) {
                    System.out.println("Falta la base imponible");
                }

                try {
                    NodeList porcentajeRetenerTag = impuestoElement.getElementsByTagName("porcentajeRetener");
                    Element porcentajeRetenerElement = (Element) porcentajeRetenerTag.item(0);
                    NodeList porcentajeRetener = porcentajeRetenerElement.getChildNodes();
                    retencion_impuestos.setPorcentajeRetener(Integer.parseInt(String.valueOf(Math.round(Double.parseDouble(((Node) porcentajeRetener.item(0)).getNodeValue().replace(",", "."))))));
                } catch (Exception e) {
                    System.out.println("Falta el porcentaje a retener");
                }

                try {
                    NodeList valorRetenidoTag = impuestoElement.getElementsByTagName("valorRetenido");
                    Element valorRetenidoElement = (Element) valorRetenidoTag.item(0);
                    NodeList valorRetenido = valorRetenidoElement.getChildNodes();
                    retencion_impuestos.setValorRetenido(Double.parseDouble(((Node) valorRetenido.item(0)).getNodeValue().toString().replace(",", "")));
                } catch (Exception e) {
                    System.out.println("Falta el valor retenido");
                }

                try {
                    NodeList codDocSustentoTag = impuestoElement.getElementsByTagName("codDocSustento");
                    Element codDocSustentoElement = (Element) codDocSustentoTag.item(0);
                    NodeList codDocSustento = codDocSustentoElement.getChildNodes();
                    retencion_impuestos.setCodDocSustento(((Node) codDocSustento.item(0)).getNodeValue());
                } catch (Exception e) {
                    System.out.println("Falta el codigo de documento de sustento");
                }

                try {
                    NodeList numDocSustentoTag = impuestoElement.getElementsByTagName("numDocSustento");
                    Element numDocSustentoElement = (Element) numDocSustentoTag.item(0);
                    NodeList numDocSustento = numDocSustentoElement.getChildNodes();
                    retencion_impuestos.setNumDocSustento(((Node) numDocSustento.item(0)).getNodeValue());
                } catch (Exception e) {
                    System.out.println("Falta el numero de documento de sustento");
                }

                try {
                    NodeList fechaEmisionDocSustentoTag = impuestoElement.getElementsByTagName("fechaEmisionDocSustento");
                    Element fechaEmisionDocSustentoElement = (Element) fechaEmisionDocSustentoTag.item(0);
                    NodeList fechaEmisionDocSustento = fechaEmisionDocSustentoElement.getChildNodes();
                    retencion_impuestos.setFechaEmisionDocSustento(((Node) fechaEmisionDocSustento.item(0)).getNodeValue());
                } catch (Exception e) {
                    System.out.println("Falta la fecha de emision del documento de sustento");
                }
            }
            retencion.setImpuesto(retencion_impuestos);
        }
        try {
            // INFO ADICIONAL
            NodeList infoAdicionalTag = doc.getElementsByTagName("infoAdicional");
            Element infoAdicional = (Element) infoAdicionalTag.item(0);
            Element infoAdicionalElements = (Element) infoAdicional;

            NodeList campoAdicionalTags = infoAdicionalElements.getElementsByTagName("campoAdicional");
            for (int ca = 0; ca < campoAdicionalTags.getLength(); ++ca) {
                ecx.unomas.retencion.InfoAdicional retencion_infoAdicional = new ecx.unomas.retencion.InfoAdicional();
                Node campoAdicional = campoAdicionalTags.item(ca);
                NamedNodeMap campoAdicionalAttr = campoAdicional.getAttributes();

                Node nombre = campoAdicionalAttr.getNamedItem("nombre");
                retencion_infoAdicional.setNombre(removeAccents(nombre.getNodeValue().trim().replace(" ", "").toLowerCase()));

                NodeList valor = campoAdicional.getChildNodes();
                retencion_infoAdicional.setValor(removeAccents(((Node) valor.item(0)).getNodeValue().trim().toLowerCase()));

                retencion.setInfAdicional(retencion_infoAdicional);
            }
        } catch (NullPointerException e) {
            // no tiene informaci�n adicional
        }
        return retencion;
    }

    public NotaDebito readNotaDebito(Document doc) {
        NotaDebito notaDebito = new NotaDebito();
        // INFO TRIBUTARIA
        NodeList infoTributariaTag = doc.getElementsByTagName("infoTributaria");
        Element infoTributaria = (Element) infoTributariaTag.item(0);
        Element infoTributariaElements = (Element) infoTributaria;

        NodeList ambienteTag = infoTributariaElements.getElementsByTagName("ambiente");
        Element ambienteElement = (Element) ambienteTag.item(0);
        NodeList ambiente = ambienteElement.getChildNodes();
        notaDebito.setAmbiente(Integer.parseInt(((Node) ambiente.item(0)).getNodeValue()));

        NodeList timpoEmisionTag = infoTributariaElements.getElementsByTagName("tipoEmision");
        Element timpoEmisionElement = (Element) timpoEmisionTag.item(0);
        NodeList tipoEmision = timpoEmisionElement.getChildNodes();
        notaDebito.setTipoEmision(Integer.parseInt(((Node) tipoEmision.item(0)).getNodeValue()));

        NodeList razonSocialTag = infoTributariaElements.getElementsByTagName("razonSocial");
        Element razonSocialElement = (Element) razonSocialTag.item(0);
        NodeList razonSocial = razonSocialElement.getChildNodes();
        notaDebito.setRazonSocial(removeAccents(((Node) razonSocial.item(0)).getNodeValue().trim().toLowerCase()));
        try {
            NodeList nombreComercialTag = infoTributariaElements.getElementsByTagName("nombreComercial");
            Element nombreComercialElement = (Element) nombreComercialTag.item(0);
            NodeList nombreComercial = nombreComercialElement.getChildNodes();
            notaDebito.setNombreComercial(removeAccents(((Node) nombreComercial.item(0)).getNodeValue().trim()));
        } catch (Exception e) {

        }
        NodeList rucTag = infoTributariaElements.getElementsByTagName("ruc");
        Element rucElement = (Element) rucTag.item(0);
        NodeList ruc = rucElement.getChildNodes();
        notaDebito.setRUC(((Node) ruc.item(0)).getNodeValue());

        NodeList claveAccesoTag = infoTributariaElements.getElementsByTagName("claveAcceso");
        Element claveAccesoElement = (Element) claveAccesoTag.item(0);
        NodeList claveAcceso = claveAccesoElement.getChildNodes();
        notaDebito.setClaveAcceso(((Node) claveAcceso.item(0)).getNodeValue());

        NodeList codDocTag = infoTributariaElements.getElementsByTagName("codDoc");
        Element codDocElement = (Element) codDocTag.item(0);
        NodeList codDoc = codDocElement.getChildNodes();
        notaDebito.setCodDoc(((Node) codDoc.item(0)).getNodeValue());

        NodeList estabTag = infoTributariaElements.getElementsByTagName("estab");
        Element estabElement = (Element) estabTag.item(0);
        NodeList estab = estabElement.getChildNodes();
        notaDebito.setEstab(((Node) estab.item(0)).getNodeValue());

        NodeList ptoEmiTag = infoTributariaElements.getElementsByTagName("ptoEmi");
        Element ptoEmiElement = (Element) ptoEmiTag.item(0);
        NodeList ptoEmi = ptoEmiElement.getChildNodes();
        notaDebito.setPtoEmi(((Node) ptoEmi.item(0)).getNodeValue());

        NodeList secuencialTag = infoTributariaElements.getElementsByTagName("secuencial");
        Element secuencialElement = (Element) secuencialTag.item(0);
        NodeList secuencial = secuencialElement.getChildNodes();
        notaDebito.setSecuencia(((Node) secuencial.item(0)).getNodeValue());

        NodeList dirMatrizTag = infoTributariaElements.getElementsByTagName("dirMatriz");
        Element dirMatrizElement = (Element) dirMatrizTag.item(0);
        NodeList dirMatriz = dirMatrizElement.getChildNodes();
        notaDebito.setDirMatriz(removeAccents(((Node) dirMatriz.item(0)).getNodeValue().trim().toLowerCase()));

        // INFO NOTA DEBITO
        NodeList infoNotaCreditoTag = doc.getElementsByTagName("infoNotaDebito");
        Element infoNotaCredito = (Element) infoNotaCreditoTag.item(0);
        Element infoNotaCreditoElements = (Element) infoNotaCredito;

        NodeList fechaEmisionTag = infoNotaCreditoElements.getElementsByTagName("fechaEmision");
        Element fechaEmisionElement = (Element) fechaEmisionTag.item(0);
        NodeList fechaEmision = fechaEmisionElement.getChildNodes();
        notaDebito.setFechaEmision(((Node) fechaEmision.item(0)).getNodeValue());

        NodeList dirEstablecimientoTag = infoNotaCreditoElements.getElementsByTagName("dirEstablecimiento");
        Element dirEstablecimientoElement = (Element) dirEstablecimientoTag.item(0);
        NodeList dirEstablecimiento = dirEstablecimientoElement.getChildNodes();
        notaDebito.setDirEstablecimiento(removeAccents(((Node) dirEstablecimiento.item(0)).getNodeValue().trim().toLowerCase()));

        NodeList tipoIdentificacionCompradorTag = infoNotaCreditoElements.getElementsByTagName("tipoIdentificacionComprador");
        Element tipoIdentificacionCompradorElement = (Element) tipoIdentificacionCompradorTag.item(0);
        NodeList tipoIdentificacionComprador = tipoIdentificacionCompradorElement.getChildNodes();
        notaDebito.setTipoIdentificacionComprador(((Node) tipoIdentificacionComprador.item(0)).getNodeValue());

        NodeList razonSocialCompradorTag = infoNotaCreditoElements.getElementsByTagName("razonSocialComprador");
        Element razonSocialCompradorElement = (Element) razonSocialCompradorTag.item(0);
        NodeList razonSocialComprador = razonSocialCompradorElement.getChildNodes();
        notaDebito.setRazonSocialComprador(removeAccents(((Node) razonSocialComprador.item(0)).getNodeValue().trim().toLowerCase()));

        NodeList identificacionCompradorTag = infoNotaCreditoElements.getElementsByTagName("identificacionComprador");
        Element identificacionCompradorElement = (Element) identificacionCompradorTag.item(0);
        NodeList identificacionComprador = identificacionCompradorElement.getChildNodes();
        notaDebito.setIdentificacionComprador(((Node) identificacionComprador.item(0)).getNodeValue());

        try {
            NodeList contribuyenteEspecialTag = infoNotaCreditoElements.getElementsByTagName("contribuyenteEspecial");
            Element contribuyenteEspecialElement = (Element) contribuyenteEspecialTag.item(0);
            NodeList contribuyenteEspecial = contribuyenteEspecialElement.getChildNodes();
            notaDebito.setContribuyenteEspecial(((Node) contribuyenteEspecial.item(0)).getNodeValue());
        } catch (NullPointerException e) {
        }

        NodeList obligadoContabilidadTag = infoNotaCreditoElements.getElementsByTagName("obligadoContabilidad");
        Element obligadoContabilidadElement = (Element) obligadoContabilidadTag.item(0);
        NodeList obligadoContabilidad = obligadoContabilidadElement.getChildNodes();
        notaDebito.setObligadoContabilidad(((Node) obligadoContabilidad.item(0)).getNodeValue());

        try {
            NodeList riseTag = infoNotaCreditoElements.getElementsByTagName("rise");
            Element riseElement = (Element) riseTag.item(0);
            NodeList rise = riseElement.getChildNodes();
            notaDebito.setRISE(((Node) rise.item(0)).getNodeValue());
        } catch (NullPointerException e) {
        }

        NodeList codDocModificadoTag = infoNotaCreditoElements.getElementsByTagName("codDocModificado");
        Element codDocModificadoElement = (Element) codDocModificadoTag.item(0);
        NodeList codDocModificado = codDocModificadoElement.getChildNodes();
        notaDebito.setCodDocModificado(((Node) codDocModificado.item(0)).getNodeValue());

        NodeList numDocModificadoTag = infoNotaCreditoElements.getElementsByTagName("numDocModificado");
        Element numDocModificadoElement = (Element) numDocModificadoTag.item(0);
        NodeList numDocModificado = numDocModificadoElement.getChildNodes();
        notaDebito.setNumDocModificado(((Node) numDocModificado.item(0)).getNodeValue());

        NodeList fechaEmisionDocSustentoTag = infoNotaCreditoElements.getElementsByTagName("fechaEmisionDocSustento");
        Element fechaEmisionDocSustentoElement = (Element) fechaEmisionDocSustentoTag.item(0);
        NodeList fechaEmisionDocSustento = fechaEmisionDocSustentoElement.getChildNodes();
        notaDebito.setFechaEmisionDocSustento(((Node) fechaEmisionDocSustento.item(0)).getNodeValue());

        NodeList totalSinImpuestosTag = infoNotaCreditoElements.getElementsByTagName("totalSinImpuestos");
        Element totalSinImpuestosElement = (Element) totalSinImpuestosTag.item(0);
        NodeList totalSinImpuestos = totalSinImpuestosElement.getChildNodes();
        notaDebito.setTotalSinImpuestos(Double.parseDouble(((Node) totalSinImpuestos.item(0)).getNodeValue().replace(",", "")));

        // IMPUESTOS
        NodeList impuestosTag = doc.getElementsByTagName("impuestos");
        Element impuestos = (Element) impuestosTag.item(0);
        Element impuestosElements = (Element) impuestos;

        NodeList impuestoTags = impuestosElements.getElementsByTagName("impuesto");
        for (int ti = 0; ti < impuestoTags.getLength(); ti++) {
            ecx.unomas.notadebito.Impuestos impuesto = new ecx.unomas.notadebito.Impuestos();
            Node impuestoTag = impuestoTags.item(ti);
            if (impuestoTag.getNodeType() == Node.ELEMENT_NODE) {
                Element impuestoElement = (Element) impuestoTag;

                NodeList codigoTag = impuestoElement.getElementsByTagName("codigo");
                Element codigoElement = (Element) codigoTag.item(0);
                NodeList codigo = codigoElement.getChildNodes();
                impuesto.setCodigo(Integer.parseInt(((Node) codigo.item(0)).getNodeValue()));

                NodeList codigoPorcentajeTag = impuestoElement.getElementsByTagName("codigoPorcentaje");
                Element codigoPorcentajeElement = (Element) codigoPorcentajeTag.item(0);
                NodeList codigoPorcentaje = codigoPorcentajeElement.getChildNodes();
                impuesto.setCodigoPorcentaje(Integer.parseInt(String.valueOf(Math.round(Double.parseDouble(((Node) codigoPorcentaje.item(0)).getNodeValue().replace(",", "."))))));

                NodeList tarifaTag = impuestoElement.getElementsByTagName("tarifa");
                Element tarifaElement = (Element) tarifaTag.item(0);
                NodeList tarifa = tarifaElement.getChildNodes();
                impuesto.setTarifa(Double.parseDouble(((Node) tarifa.item(0)).getNodeValue()));

                NodeList baseImponibleTag = impuestoElement.getElementsByTagName("baseImponible");
                Element baseImponibleElement = (Element) baseImponibleTag.item(0);
                NodeList baseImponible = baseImponibleElement.getChildNodes();
                impuesto.setBaseImponible(Double.parseDouble(((Node) baseImponible.item(0)).getNodeValue().replace(",", "")));

                NodeList valorTag = impuestoElement.getElementsByTagName("valor");
                Element valorElement = (Element) valorTag.item(0);
                NodeList valor = valorElement.getChildNodes();
                impuesto.setValor(Double.parseDouble(((Node) valor.item(0)).getNodeValue().replace(",", "")));
            }
            notaDebito.setImpuestos(impuesto);
        }

        NodeList valorTotalTag = infoNotaCreditoElements.getElementsByTagName("valorTotal");
        Element valorTotalElement = (Element) valorTotalTag.item(0);
        NodeList valorTotal = valorTotalElement.getChildNodes();
        notaDebito.setValorTotal(Double.parseDouble(((Node) valorTotal.item(0)).getNodeValue()));

        // MOTIVOS
        NodeList motivosTag = doc.getElementsByTagName("motivos");
        Element motivos = (Element) motivosTag.item(0);
        Element motivosElements = (Element) motivos;

        NodeList motivosTags = motivosElements.getElementsByTagName("motivo");
        for (int d = 0; d < motivosTags.getLength(); d++) {
            ecx.unomas.notadebito.Motivos notadebito_motivos = new ecx.unomas.notadebito.Motivos();
            Node motivo = motivosTags.item(d);
            if (motivo.getNodeType() == Node.ELEMENT_NODE) {
                Element motivoElement = (Element) motivo;

                NodeList razonTag = motivoElement.getElementsByTagName("razon");
                Element razonElement = (Element) razonTag.item(0);
                NodeList razon = razonElement.getChildNodes();
                notadebito_motivos.setRazon(removeAccents(((Node) razon.item(0)).getNodeValue().trim().toLowerCase()));

                NodeList valorTag = motivoElement.getElementsByTagName("valor");
                Element valorElement = (Element) valorTag.item(0);
                NodeList valor = valorElement.getChildNodes();
                notadebito_motivos.setValor(Double.parseDouble(((Node) valor.item(0)).getNodeValue()));

            }
            notaDebito.setMotivos(notadebito_motivos);
        }
        try {
            // INFO ADICIONAL
            NodeList infoAdicionalTag = doc.getElementsByTagName("infoAdicional");
            Element infoAdicional = (Element) infoAdicionalTag.item(0);
            Element infoAdicionalElements = (Element) infoAdicional;
            NodeList campoAdicionalTags = infoAdicionalElements.getElementsByTagName("campoAdicional");
            for (int ca = 0; ca < campoAdicionalTags.getLength(); ++ca) {
                ecx.unomas.notadebito.InfoAdicional notadebito_infoAdicional = new ecx.unomas.notadebito.InfoAdicional();
                Node campoAdicional = campoAdicionalTags.item(ca);
                NamedNodeMap campoAdicionalAttr = campoAdicional.getAttributes();

                Node nombre = campoAdicionalAttr.getNamedItem("nombre");
                notadebito_infoAdicional.setNombre(removeAccents(nombre.getNodeValue().trim().replace(" ", "").toLowerCase()));

                NodeList valor = campoAdicional.getChildNodes();
                notadebito_infoAdicional.setValor(removeAccents(((Node) valor.item(0)).getNodeValue().trim().toLowerCase()));

                notaDebito.setInfAdicional(notadebito_infoAdicional);
            }
        } catch (NullPointerException e) {
        }
        return notaDebito;
    }

    public NotaCredito readNotaCredito(Document doc) {
        NotaCredito notaCredito = new NotaCredito();
        // INFO TRIBUTARIA
        NodeList infoTributariaTag = doc.getElementsByTagName("infoTributaria");
        Element infoTributaria = (Element) infoTributariaTag.item(0);
        Element infoTributariaElements = (Element) infoTributaria;

        try {
            NodeList ambienteTag = infoTributariaElements.getElementsByTagName("ambiente");
            Element ambienteElement = (Element) ambienteTag.item(0);
            NodeList ambiente = ambienteElement.getChildNodes();
            notaCredito.setAmbiente(Integer.parseInt(((Node) ambiente.item(0)).getNodeValue()));
        } catch (Exception e) {
            System.out.println("Falta el ambiente");
        }

        try {
            NodeList timpoEmisionTag = infoTributariaElements.getElementsByTagName("tipoEmision");
            Element timpoEmisionElement = (Element) timpoEmisionTag.item(0);
            NodeList tipoEmision = timpoEmisionElement.getChildNodes();
            notaCredito.setTipoEmision(Integer.parseInt(((Node) tipoEmision.item(0)).getNodeValue()));
        } catch (Exception e) {
            System.out.println("Falta el tipo de emision");
        }

        try {
            NodeList razonSocialTag = infoTributariaElements.getElementsByTagName("razonSocial");
            Element razonSocialElement = (Element) razonSocialTag.item(0);
            NodeList razonSocial = razonSocialElement.getChildNodes();
            notaCredito.setRazonSocial(removeAccents(((Node) razonSocial.item(0)).getNodeValue().trim().toLowerCase()));
        } catch (Exception e) {
            System.out.println("Falta la razon social");
        }

        try {
            NodeList nombreComercialTag = infoTributariaElements.getElementsByTagName("nombreComercial");
            Element nombreComercialElement = (Element) nombreComercialTag.item(0);
            NodeList nombreComercial = nombreComercialElement.getChildNodes();
            notaCredito.setNombreComercial(removeAccents(((Node) nombreComercial.item(0)).getNodeValue().trim()));
        } catch (Exception e) {
        }

        try {
            NodeList rucTag = infoTributariaElements.getElementsByTagName("ruc");
            Element rucElement = (Element) rucTag.item(0);
            NodeList ruc = rucElement.getChildNodes();
            notaCredito.setRUC(((Node) ruc.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta el RUC");
        }

        try {
            NodeList claveAccesoTag = infoTributariaElements.getElementsByTagName("claveAcceso");
            Element claveAccesoElement = (Element) claveAccesoTag.item(0);
            NodeList claveAcceso = claveAccesoElement.getChildNodes();
            notaCredito.setClaveAcceso(((Node) claveAcceso.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta la clave de acceso");
        }

        try {
            NodeList codDocTag = infoTributariaElements.getElementsByTagName("codDoc");
            Element codDocElement = (Element) codDocTag.item(0);
            NodeList codDoc = codDocElement.getChildNodes();
            notaCredito.setCodDoc(((Node) codDoc.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta el codigo de documento");
        }

        try {
            NodeList estabTag = infoTributariaElements.getElementsByTagName("estab");
            Element estabElement = (Element) estabTag.item(0);
            NodeList estab = estabElement.getChildNodes();
            notaCredito.setEstab(((Node) estab.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta el establecimiento");
        }

        try {
            NodeList ptoEmiTag = infoTributariaElements.getElementsByTagName("ptoEmi");
            Element ptoEmiElement = (Element) ptoEmiTag.item(0);
            NodeList ptoEmi = ptoEmiElement.getChildNodes();
            notaCredito.setPtoEmi(((Node) ptoEmi.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta el punto de emision");
        }

        try {
            NodeList secuencialTag = infoTributariaElements.getElementsByTagName("secuencial");
            Element secuencialElement = (Element) secuencialTag.item(0);
            NodeList secuencial = secuencialElement.getChildNodes();
            notaCredito.setSecuencia(((Node) secuencial.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta el secuencial");
        }

        try {
            NodeList dirMatrizTag = infoTributariaElements.getElementsByTagName("dirMatriz");
            Element dirMatrizElement = (Element) dirMatrizTag.item(0);
            NodeList dirMatriz = dirMatrizElement.getChildNodes();
            notaCredito.setDirMatriz(removeAccents(((Node) dirMatriz.item(0)).getNodeValue().trim().toLowerCase()));
        } catch (Exception e) {
            System.out.println("Falta la direccion matriz");
        }

        // INFO NOTA CREDITO
        NodeList infoNotaCreditoTag = doc.getElementsByTagName("infoNotaCredito");
        Element infoNotaCredito = (Element) infoNotaCreditoTag.item(0);
        Element infoNotaCreditoElements = (Element) infoNotaCredito;

        try {
            NodeList fechaEmisionTag = infoNotaCreditoElements.getElementsByTagName("fechaEmision");
            Element fechaEmisionElement = (Element) fechaEmisionTag.item(0);
            NodeList fechaEmision = fechaEmisionElement.getChildNodes();
            notaCredito.setFechaEmision(((Node) fechaEmision.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta la fecha de emision");
        }

        try {
            NodeList dirEstablecimientoTag = infoNotaCreditoElements.getElementsByTagName("dirEstablecimiento");
            Element dirEstablecimientoElement = (Element) dirEstablecimientoTag.item(0);
            NodeList dirEstablecimiento = dirEstablecimientoElement.getChildNodes();
            notaCredito.setDirEstablecimiento(removeAccents(((Node) dirEstablecimiento.item(0)).getNodeValue().trim().toLowerCase()));
        } catch (Exception e) {
            System.out.println("Falta la direccion de establecimiento");
        }

        try {
            NodeList tipoIdentificacionCompradorTag = infoNotaCreditoElements.getElementsByTagName("tipoIdentificacionComprador");
            Element tipoIdentificacionCompradorElement = (Element) tipoIdentificacionCompradorTag.item(0);
            NodeList tipoIdentificacionComprador = tipoIdentificacionCompradorElement.getChildNodes();
            notaCredito.setTipoIdentificacionComprador(((Node) tipoIdentificacionComprador.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta el tipo de identificacion del comprador");
        }

        try {
            NodeList razonSocialCompradorTag = infoNotaCreditoElements.getElementsByTagName("razonSocialComprador");
            Element razonSocialCompradorElement = (Element) razonSocialCompradorTag.item(0);
            NodeList razonSocialComprador = razonSocialCompradorElement.getChildNodes();
            notaCredito.setRazonSocialComprador(removeAccents(((Node) razonSocialComprador.item(0)).getNodeValue().trim().toLowerCase()));
        } catch (Exception e) {
            System.out.println("Falta la razon social del comprador");
        }

        try {
            NodeList identificacionCompradorTag = infoNotaCreditoElements.getElementsByTagName("identificacionComprador");
            Element identificacionCompradorElement = (Element) identificacionCompradorTag.item(0);
            NodeList identificacionComprador = identificacionCompradorElement.getChildNodes();
            notaCredito.setIdentificacionComprador(((Node) identificacionComprador.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta la identificacion del comprador");
        }

        try {
            NodeList contribuyenteEspecialTag = infoNotaCreditoElements.getElementsByTagName("contribuyenteEspecial");
            Element contribuyenteEspecialElement = (Element) contribuyenteEspecialTag.item(0);
            NodeList contribuyenteEspecial = contribuyenteEspecialElement.getChildNodes();
            notaCredito.setContribuyenteEspecial(((Node) contribuyenteEspecial.item(0)).getNodeValue());
        } catch (NullPointerException e) {
        }

        try {
            NodeList obligadoContabilidadTag = infoNotaCreditoElements.getElementsByTagName("obligadoContabilidad");
            Element obligadoContabilidadElement = (Element) obligadoContabilidadTag.item(0);
            NodeList obligadoContabilidad = obligadoContabilidadElement.getChildNodes();
            notaCredito.setObligadoContabilidad(((Node) obligadoContabilidad.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta obligado a llevar contabilidad");
        }

        try {
            NodeList riseTag = infoNotaCreditoElements.getElementsByTagName("rise");
            Element riseElement = (Element) riseTag.item(0);
            NodeList rise = riseElement.getChildNodes();
            notaCredito.setRISE(((Node) rise.item(0)).getNodeValue());
        } catch (NullPointerException e) {
        }

        try {
            NodeList codDocModificadoTag = infoNotaCreditoElements.getElementsByTagName("codDocModificado");
            Element codDocModificadoElement = (Element) codDocModificadoTag.item(0);
            NodeList codDocModificado = codDocModificadoElement.getChildNodes();
            notaCredito.setCodDocModificado(((Node) codDocModificado.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta el codigo de documento modificado");
        }

        try {
            NodeList numDocModificadoTag = infoNotaCreditoElements.getElementsByTagName("numDocModificado");
            Element numDocModificadoElement = (Element) numDocModificadoTag.item(0);
            NodeList numDocModificado = numDocModificadoElement.getChildNodes();
            notaCredito.setNumDocModificado(((Node) numDocModificado.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta el numero de documento modificado");
        }

        try {
            NodeList fechaEmisionDocSustentoTag = infoNotaCreditoElements.getElementsByTagName("fechaEmisionDocSustento");
            Element fechaEmisionDocSustentoElement = (Element) fechaEmisionDocSustentoTag.item(0);
            NodeList fechaEmisionDocSustento = fechaEmisionDocSustentoElement.getChildNodes();
            notaCredito.setFechaEmisionDocSustento(((Node) fechaEmisionDocSustento.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta la fecha de emision de documento de sustento");
        }

        try {
            NodeList totalSinImpuestosTag = infoNotaCreditoElements.getElementsByTagName("totalSinImpuestos");
            Element totalSinImpuestosElement = (Element) totalSinImpuestosTag.item(0);
            NodeList totalSinImpuestos = totalSinImpuestosElement.getChildNodes();
            notaCredito.setTotalSinImpuestos(Double.parseDouble(((Node) totalSinImpuestos.item(0)).getNodeValue().replace(",", "")));
        } catch (Exception e) {
            System.out.println("Falta total sin impuestos");
        }

        try {
            NodeList valorModificacionTag = infoNotaCreditoElements.getElementsByTagName("valorModificacion");
            Element valorModificacionElement = (Element) valorModificacionTag.item(0);
            NodeList valorModificacion = valorModificacionElement.getChildNodes();
            notaCredito.setValorModificacion(Double.parseDouble(((Node) valorModificacion.item(0)).getNodeValue().replace(",", "")));
        } catch (Exception e) {
            System.out.println("Falta el valor de modificacion");
        }

        try {
            NodeList monedaTag = infoNotaCreditoElements.getElementsByTagName("moneda");
            Element monedaElement = (Element) monedaTag.item(0);
            NodeList moneda = monedaElement.getChildNodes();
            notaCredito.setMoneda(((Node) moneda.item(0)).getNodeValue());
        } catch (Exception e) {
            System.out.println("Falta la moneda");
        }

        // TOTAL CON IMPUESTOS
        NodeList totalConImpuestosTag = doc.getElementsByTagName("totalConImpuestos");
        Element totalConImpuestos = (Element) totalConImpuestosTag.item(0);
        Element totalConImpuestosElements = (Element) totalConImpuestos;

        NodeList totalImpuestoTags = totalConImpuestosElements.getElementsByTagName("totalImpuesto");
        for (int ti = 0; ti < totalImpuestoTags.getLength(); ti++) {
            ecx.unomas.notacredito.TotalConImpuestos totalImpuesto = new ecx.unomas.notacredito.TotalConImpuestos();
            Node impuesto = totalImpuestoTags.item(ti);
            if (impuesto.getNodeType() == Node.ELEMENT_NODE) {
                Element impuestoElement = (Element) impuesto;

                try {
                    NodeList codigoTag = impuestoElement.getElementsByTagName("codigo");
                    Element codigoElement = (Element) codigoTag.item(0);
                    NodeList codigo = codigoElement.getChildNodes();
                    totalImpuesto.setCodigo(Integer.parseInt(((Node) codigo.item(0)).getNodeValue()));
                } catch (Exception e) {
                    System.out.println("Falta el codigo (total impuesto)");
                }

                try {
                    NodeList codigoPorcentajeTag = impuestoElement.getElementsByTagName("codigoPorcentaje");
                    Element codigoPorcentajeElement = (Element) codigoPorcentajeTag.item(0);
                    NodeList codigoPorcentaje = codigoPorcentajeElement.getChildNodes();
                    totalImpuesto.setCodigoPorcentaje(Integer.parseInt(String.valueOf(Math.round(Double.parseDouble(((Node) codigoPorcentaje.item(0)).getNodeValue().replace(",", "."))))));
                } catch (Exception e) {
                    System.out.println("Falta el codigo de porcentaje (total impuesto)");
                }

                try {
                    NodeList baseImponibleTag = impuestoElement.getElementsByTagName("baseImponible");
                    Element baseImponibleElement = (Element) baseImponibleTag.item(0);
                    NodeList baseImponible = baseImponibleElement.getChildNodes();
                    totalImpuesto.setBaseImponible(Double.parseDouble(((Node) baseImponible.item(0)).getNodeValue().replace(",", "")));
                } catch (Exception e) {
                    System.out.println("Falta la base imponible");
                }

                try {
                    NodeList valorTag = impuestoElement.getElementsByTagName("valor");
                    Element valorElement = (Element) valorTag.item(0);
                    NodeList valor = valorElement.getChildNodes();
                    totalImpuesto.setValor(Double.parseDouble(((Node) valor.item(0)).getNodeValue().replace(",", "")));
                } catch (Exception e) {
                    System.out.println("Falta el valor (total impuesto)");
                }
            }
            notaCredito.setTotalConImpuesto(totalImpuesto);
        }

        try {
            NodeList motivoTag = infoNotaCreditoElements.getElementsByTagName("motivo");
            Element motivoElement = (Element) motivoTag.item(0);
            NodeList motivo = motivoElement.getChildNodes();
            notaCredito.setMotivo(removeAccents(((Node) motivo.item(0)).getNodeValue().toLowerCase()));
        } catch (Exception e) {
            System.out.println("Falta el motivo");
        }

        // DETALLES
        NodeList detallesTag = doc.getElementsByTagName("detalles");
        Element detalles = (Element) detallesTag.item(0);
        Element detallesElements = (Element) detalles;

        NodeList detalleTags = detallesElements.getElementsByTagName("detalle");
        for (int d = 0; d < detalleTags.getLength(); d++) {
            ecx.unomas.notacredito.Detalles notacredito_detalle = new ecx.unomas.notacredito.Detalles();
            Node detalle = detalleTags.item(d);
            if (detalle.getNodeType() == Node.ELEMENT_NODE) {
                Element detalleElement = (Element) detalle;

                try {
                    NodeList codigoInternoTag = detalleElement.getElementsByTagName("codigoInterno");
                    Element codigoInternoElement = (Element) codigoInternoTag.item(0);
                    NodeList codigoInterno = codigoInternoElement.getChildNodes();
                    notacredito_detalle.setCodigoInterno(((Node) codigoInterno.item(0)).getNodeValue());
                } catch (NullPointerException e) {
                    try {
                        NodeList codigoInternoTag = detalleElement.getElementsByTagName("codigoPrincipal");
                        Element codigoInternoElement = (Element) codigoInternoTag.item(0);
                        NodeList codigoInterno = codigoInternoElement.getChildNodes();
                        notacredito_detalle.setCodigoInterno(((Node) codigoInterno.item(0)).getNodeValue());
                    } catch (Exception ex) {
                        System.out.println("Falta el codigo interno");
                    }
                }
                try {
                    NodeList codigoAdicionalTag = detalleElement.getElementsByTagName("codigoAdicional");
                    Element codigoAdicionalElement = (Element) codigoAdicionalTag.item(0);
                    NodeList codigoAdicional = codigoAdicionalElement.getChildNodes();
                    notacredito_detalle.setCodigoAdicional(((Node) codigoAdicional.item(0)).getNodeValue());
                } catch (NullPointerException e) {
                    try {
                        NodeList codigoAdicionalTag = detalleElement.getElementsByTagName("codigoAuxiliar");
                        Element codigoAdicionalElement = (Element) codigoAdicionalTag.item(0);
                        NodeList codigoAdicional = codigoAdicionalElement.getChildNodes();
                        notacredito_detalle.setCodigoAdicional(((Node) codigoAdicional.item(0)).getNodeValue());
                    } catch (NullPointerException e2) {

                    }
                }

                try {
                    NodeList descripcionTag = detalleElement.getElementsByTagName("descripcion");
                    Element descripcionElement = (Element) descripcionTag.item(0);
                    NodeList descripcion = descripcionElement.getChildNodes();
                    notacredito_detalle.setDescripcion(removeAccents(((Node) descripcion.item(0)).getNodeValue().trim().toLowerCase()));
                } catch (Exception e) {
                    System.out.println("Falta la descripcion");
                }

                try {
                    NodeList cantidadTag = detalleElement.getElementsByTagName("cantidad");
                    Element cantidadElement = (Element) cantidadTag.item(0);
                    NodeList cantidad = cantidadElement.getChildNodes();
                    notacredito_detalle.setCantidad(Double.parseDouble(((Node) cantidad.item(0)).getNodeValue().replace(",", "")));
                } catch (Exception e) {
                    System.out.println("Falta la cantidad");
                }

                try {
                    NodeList precioUnitarioTag = detalleElement.getElementsByTagName("precioUnitario");
                    Element precioUnitarioElement = (Element) precioUnitarioTag.item(0);
                    NodeList precioUnitario = precioUnitarioElement.getChildNodes();
                    notacredito_detalle.setPrecioUnitario(Double.parseDouble(((Node) precioUnitario.item(0)).getNodeValue().replace(",", "")));
                } catch (Exception e) {
                    System.out.println("Falta el precio unitario");
                }

                try {
                    NodeList descuentoTag = detalleElement.getElementsByTagName("descuento");
                    Element descuentoElement = (Element) descuentoTag.item(0);
                    NodeList descuento = descuentoElement.getChildNodes();
                    notacredito_detalle.setDescuento(Double.parseDouble(((Node) descuento.item(0)).getNodeValue().replace(",", "")));
                } catch (Exception e) {
                    System.out.println("Falta el descuento");
                }

                try {
                    NodeList precioTotalSinImpuestoTag = detalleElement.getElementsByTagName("precioTotalSinImpuesto");
                    Element precioTotalSinImpuestoElement = (Element) precioTotalSinImpuestoTag.item(0);
                    NodeList precioTotalSinImpuesto = precioTotalSinImpuestoElement.getChildNodes();
                    notacredito_detalle.setPrecioTotalSinImpuesto(Double.parseDouble(((Node) precioTotalSinImpuesto.item(0)).getNodeValue().replace(",", "")));
                } catch (Exception e) {
                    System.out.println("Falta el precio total sin impuestos");
                }

                try {
                    // DETALLES ADICIONALES
                    NodeList detallesAdicionalesTag = detalleElement.getElementsByTagName("detallesAdicionales");
                    Element detallesAdicionales = (Element) detallesAdicionalesTag.item(0);
                    Element detallesAdicionalesElements = (Element) detallesAdicionales;

                    NodeList detAdicionalTag = detallesAdicionalesElements.getElementsByTagName("detAdicional");
                    Vector<ecx.unomas.notacredito.DetAdicional> detAdicionales = new Vector<ecx.unomas.notacredito.DetAdicional>();
                    for (int da = 0; da < detAdicionalTag.getLength(); ++da) {
                        ecx.unomas.notacredito.DetAdicional notacredito_detAdicional = new ecx.unomas.notacredito.DetAdicional();
                        Node detAdicional = detAdicionalTag.item(da);
                        NamedNodeMap detAdicionalAttr = detAdicional.getAttributes();

                        Node nombre = detAdicionalAttr.getNamedItem("nombre");
                        notacredito_detAdicional.setNombre(removeAccents(nombre.getNodeValue().trim().replace(" ", "").toLowerCase()));

                        Node valor = detAdicionalAttr.getNamedItem("valor");
                        notacredito_detAdicional.setValor(removeAccents(valor.getNodeValue().trim().toLowerCase()));

                        detAdicionales.add(notacredito_detAdicional);
                    }
                    notacredito_detalle.setDetAdicional(detAdicionales);
                } catch (NullPointerException e) {
                    // no tiene detalles adicionales
                }
                // IMPUESTOS
                NodeList impuestosTag = detalleElement.getElementsByTagName("impuestos");
                Element impuestos = (Element) impuestosTag.item(0);
                Element impuestosElements = (Element) impuestos;

                NodeList detImpuestosTag = impuestosElements.getElementsByTagName("impuesto");
                Vector<ecx.unomas.notacredito.DetImpuestos> DetImpuestos = new Vector<ecx.unomas.notacredito.DetImpuestos>();
                for (int di = 0; di < detImpuestosTag.getLength(); di++) {
                    ecx.unomas.notacredito.DetImpuestos impuesto = new ecx.unomas.notacredito.DetImpuestos();
                    Node detImpuestos = detImpuestosTag.item(di);
                    if (detImpuestos.getNodeType() == Node.ELEMENT_NODE) {
                        Element detImpuestosElement = (Element) detImpuestos;

                        try {
                            NodeList codigoTag = detImpuestosElement.getElementsByTagName("codigo");
                            Element codigoElement = (Element) codigoTag.item(0);
                            NodeList codigo = codigoElement.getChildNodes();
                            impuesto.setCodigo(Integer.parseInt(((Node) codigo.item(0)).getNodeValue()));
                        } catch (Exception e) {
                            System.out.println("Falta el codigo (impuesto)");
                        }

                        try {
                            NodeList codigoPorcentajeTag = detImpuestosElement.getElementsByTagName("codigoPorcentaje");
                            Element codigoPorcentajeElement = (Element) codigoPorcentajeTag.item(0);
                            NodeList codigoPorcentaje = codigoPorcentajeElement.getChildNodes();
                            impuesto.setCodigoPorcentaje(Integer.parseInt(String.valueOf(Math.round(Double.parseDouble(((Node) codigoPorcentaje.item(0)).getNodeValue().replace(",", "."))))));
                        } catch (Exception e) {
                            System.out.println("Falta el codigo de porcentaje (impuesto)");
                        }

                        try {
                            NodeList tarifaTag = detImpuestosElement.getElementsByTagName("tarifa");
                            Element tarifaElement = (Element) tarifaTag.item(0);
                            NodeList tarifa = tarifaElement.getChildNodes();
                            impuesto.setTarifa(Double.parseDouble(((Node) tarifa.item(0)).getNodeValue().replace(",", "")));
                        } catch (Exception e) {
                            System.out.println("Falta la tarifa (impuesto)");
                        }

                        try {
                            NodeList baseImponibleTag = detImpuestosElement.getElementsByTagName("baseImponible");
                            Element baseImponibleElement = (Element) baseImponibleTag.item(0);
                            NodeList baseImponible = baseImponibleElement.getChildNodes();
                            impuesto.setBaseImponible(Double.parseDouble(((Node) baseImponible.item(0)).getNodeValue().replace(",", "")));
                        } catch (Exception e) {
                            System.out.println("Falta la base imponible (impuesto)");
                        }

                        try {
                            NodeList valorTag = detImpuestosElement.getElementsByTagName("valor");
                            Element valorElement = (Element) valorTag.item(0);
                            NodeList valor = valorElement.getChildNodes();
                            impuesto.setValor(Double.parseDouble(((Node) valor.item(0)).getNodeValue().replace(",", "")));
                        } catch (Exception e) {
                            System.out.println("Falta el valor (impuesto)");
                        }
                    }
                    DetImpuestos.add(impuesto);
                }
                notacredito_detalle.setImpuesto(DetImpuestos);
            }
            notaCredito.setDetalle(notacredito_detalle);
        }
        try {
            // INFO ADICIONAL
            NodeList infoAdicionalTag = doc.getElementsByTagName("infoAdicional");
            Element infoAdicional = (Element) infoAdicionalTag.item(0);
            Element infoAdicionalElements = (Element) infoAdicional;

            NodeList campoAdicionalTags = infoAdicionalElements.getElementsByTagName("campoAdicional");
            for (int ca = 0; ca < campoAdicionalTags.getLength(); ++ca) {
                ecx.unomas.notacredito.InfoAdicional factura_infoAdicional = new ecx.unomas.notacredito.InfoAdicional();
                Node campoAdicional = campoAdicionalTags.item(ca);
                NamedNodeMap campoAdicionalAttr = campoAdicional.getAttributes();

                Node nombre = campoAdicionalAttr.getNamedItem("nombre");
                factura_infoAdicional.setNombre(removeAccents(nombre.getNodeValue().trim().replace(" ", "").toLowerCase()));

                NodeList valor = campoAdicional.getChildNodes();
                factura_infoAdicional.setValor(removeAccents(((Node) valor.item(0)).getNodeValue().trim().toLowerCase()));

                notaCredito.setInfAdicional(factura_infoAdicional);
            }
        } catch (NullPointerException e) {
            // no tiene informaci�n adicional
        }
        return notaCredito;
    }

    public GuiaRemision readGuiaRemision(Document doc) {
        GuiaRemision guiaRemision = new GuiaRemision();
        // INFO TRIBUTARIA
        NodeList infoTributariaTag = doc.getElementsByTagName("infoTributaria");
        Element infoTributaria = (Element) infoTributariaTag.item(0);
        Element infoTributariaElements = (Element) infoTributaria;

        NodeList ambienteTag = infoTributariaElements.getElementsByTagName("ambiente");
        Element ambienteElement = (Element) ambienteTag.item(0);
        NodeList ambiente = ambienteElement.getChildNodes();
        guiaRemision.setAmbiente(Integer.parseInt(((Node) ambiente.item(0)).getNodeValue()));

        NodeList timpoEmisionTag = infoTributariaElements.getElementsByTagName("tipoEmision");
        Element timpoEmisionElement = (Element) timpoEmisionTag.item(0);
        NodeList tipoEmision = timpoEmisionElement.getChildNodes();
        guiaRemision.setTipoEmision(Integer.parseInt(((Node) tipoEmision.item(0)).getNodeValue()));

        NodeList razonSocialTag = infoTributariaElements.getElementsByTagName("razonSocial");
        Element razonSocialElement = (Element) razonSocialTag.item(0);
        NodeList razonSocial = razonSocialElement.getChildNodes();
        guiaRemision.setRazonSocial(removeAccents(((Node) razonSocial.item(0)).getNodeValue().trim().toLowerCase()));
        try {
            NodeList nombreComercialTag = infoTributariaElements.getElementsByTagName("nombreComercial");
            Element nombreComercialElement = (Element) nombreComercialTag.item(0);
            NodeList nombreComercial = nombreComercialElement.getChildNodes();
            guiaRemision.setNombreComercial(removeAccents(((Node) nombreComercial.item(0)).getNodeValue().trim().toLowerCase()));
        } catch (Exception e) {
        }
        NodeList rucTag = infoTributariaElements.getElementsByTagName("ruc");
        Element rucElement = (Element) rucTag.item(0);
        NodeList ruc = rucElement.getChildNodes();
        guiaRemision.setRUC(((Node) ruc.item(0)).getNodeValue());

        NodeList claveAccesoTag = infoTributariaElements.getElementsByTagName("claveAcceso");
        Element claveAccesoElement = (Element) claveAccesoTag.item(0);
        NodeList claveAcceso = claveAccesoElement.getChildNodes();
        guiaRemision.setClaveAcceso(((Node) claveAcceso.item(0)).getNodeValue());

        NodeList codDocTag = infoTributariaElements.getElementsByTagName("codDoc");
        Element codDocElement = (Element) codDocTag.item(0);
        NodeList codDoc = codDocElement.getChildNodes();
        guiaRemision.setCodDoc(((Node) codDoc.item(0)).getNodeValue());

        NodeList estabTag = infoTributariaElements.getElementsByTagName("estab");
        Element estabElement = (Element) estabTag.item(0);
        NodeList estab = estabElement.getChildNodes();
        guiaRemision.setEstab(((Node) estab.item(0)).getNodeValue());

        NodeList ptoEmiTag = infoTributariaElements.getElementsByTagName("ptoEmi");
        Element ptoEmiElement = (Element) ptoEmiTag.item(0);
        NodeList ptoEmi = ptoEmiElement.getChildNodes();
        guiaRemision.setPtoEmi(((Node) ptoEmi.item(0)).getNodeValue());

        NodeList secuencialTag = infoTributariaElements.getElementsByTagName("secuencial");
        Element secuencialElement = (Element) secuencialTag.item(0);
        NodeList secuencial = secuencialElement.getChildNodes();
        guiaRemision.setSecuencia(((Node) secuencial.item(0)).getNodeValue());

        NodeList dirMatrizTag = infoTributariaElements.getElementsByTagName("dirMatriz");
        Element dirMatrizElement = (Element) dirMatrizTag.item(0);
        NodeList dirMatriz = dirMatrizElement.getChildNodes();
        guiaRemision.setDirMatriz(removeAccents(((Node) dirMatriz.item(0)).getNodeValue().trim().toLowerCase()));

        // INFO GUIA REMISION
        NodeList infoGuiaRemisionTag = doc.getElementsByTagName("infoGuiaRemision");
        Element infoGuiaRemision = (Element) infoGuiaRemisionTag.item(0);
        Element infoGuiaRemisionElements = (Element) infoGuiaRemision;

        NodeList dirEstablecimientoTag = infoGuiaRemisionElements.getElementsByTagName("dirEstablecimiento");
        Element dirEstablecimientoElement = (Element) dirEstablecimientoTag.item(0);
        NodeList dirEstablecimiento = dirEstablecimientoElement.getChildNodes();
        guiaRemision.setDirEstablecimiento(removeAccents(((Node) dirEstablecimiento.item(0)).getNodeValue().trim().toLowerCase()));

        NodeList dirPartidaTag = infoGuiaRemisionElements.getElementsByTagName("dirPartida");
        Element dirPartidaElement = (Element) dirPartidaTag.item(0);
        NodeList dirPartida = dirPartidaElement.getChildNodes();
        guiaRemision.setDirPartida(removeAccents(((Node) dirPartida.item(0)).getNodeValue().trim().toLowerCase()));

        NodeList razonSocialTransportistaTag = infoGuiaRemisionElements.getElementsByTagName("razonSocialTransportista");
        Element razonSocialTransportistaElement = (Element) razonSocialTransportistaTag.item(0);
        NodeList razonSocialTransportista = razonSocialTransportistaElement.getChildNodes();
        guiaRemision.setRazonSocialTransportista(removeAccents(((Node) razonSocialTransportista.item(0)).getNodeValue().trim().toLowerCase()));

        NodeList tipoIdentificacionTransportistaTag = infoGuiaRemisionElements.getElementsByTagName("tipoIdentificacionTransportista");
        Element tipoIdentificacionTransportistaElement = (Element) tipoIdentificacionTransportistaTag.item(0);
        NodeList tipoIdentificacionTransportista = tipoIdentificacionTransportistaElement.getChildNodes();
        guiaRemision.setTipoIdentificacionTransportista(((Node) tipoIdentificacionTransportista.item(0)).getNodeValue().trim());

        NodeList rucTransportistaTag = infoGuiaRemisionElements.getElementsByTagName("rucTransportista");
        Element rucTransportistaElement = (Element) rucTransportistaTag.item(0);
        NodeList rucTransportista = rucTransportistaElement.getChildNodes();
        guiaRemision.setRucTransportista(((Node) rucTransportista.item(0)).getNodeValue().trim());

        try {
            NodeList riseTag = infoGuiaRemisionElements.getElementsByTagName("rise");
            Element riseElement = (Element) riseTag.item(0);
            NodeList rise = riseElement.getChildNodes();
            guiaRemision.setRISE(((Node) rise.item(0)).getNodeValue().trim());
        } catch (NullPointerException e) {
        }

        NodeList obligadoContabilidadTag = infoGuiaRemisionElements.getElementsByTagName("obligadoContabilidad");
        Element obligadoContabilidadElement = (Element) obligadoContabilidadTag.item(0);
        NodeList obligadoContabilidad = obligadoContabilidadElement.getChildNodes();
        guiaRemision.setObligadoContabilidad(((Node) obligadoContabilidad.item(0)).getNodeValue());

        try {
            NodeList contribuyenteEspecialTag = infoGuiaRemisionElements.getElementsByTagName("contribuyenteEspecial");
            Element contribuyenteEspecialElement = (Element) contribuyenteEspecialTag.item(0);
            NodeList contribuyenteEspecial = contribuyenteEspecialElement.getChildNodes();
            guiaRemision.setContribuyenteEspecial(((Node) contribuyenteEspecial.item(0)).getNodeValue());
        } catch (NullPointerException e) {
        }

        NodeList fechaIniTransporteTag = infoGuiaRemisionElements.getElementsByTagName("fechaIniTransporte");
        Element fechaIniTransporteElement = (Element) fechaIniTransporteTag.item(0);
        NodeList fechaIniTransporte = fechaIniTransporteElement.getChildNodes();
        guiaRemision.setFechaIniTransporte(((Node) fechaIniTransporte.item(0)).getNodeValue().trim());

        NodeList fechaFinTransporteTag = infoGuiaRemisionElements.getElementsByTagName("fechaFinTransporte");
        Element fechaFinTransporteElement = (Element) fechaFinTransporteTag.item(0);
        NodeList fechaFinTransporte = fechaFinTransporteElement.getChildNodes();
        guiaRemision.setFechaFinTransporte(((Node) fechaFinTransporte.item(0)).getNodeValue().trim());

        NodeList placaTag = infoGuiaRemisionElements.getElementsByTagName("placa");
        Element placaElement = (Element) placaTag.item(0);
        NodeList placa = placaElement.getChildNodes();
        guiaRemision.setPlaca(((Node) placa.item(0)).getNodeValue().trim());

        // DESTINATARIOS
        NodeList destinatariosTag = doc.getElementsByTagName("destinatarios");
        Element destinatarios = (Element) destinatariosTag.item(0);
        Element destinatariosElements = (Element) destinatarios;

        NodeList distanatarioTags = destinatariosElements.getElementsByTagName("destinatario");
        for (int d = 0; d < distanatarioTags.getLength(); d++) {
            Destinatarios guiaRemision_destinatarios = new Destinatarios();
            Node destinatario = distanatarioTags.item(d);
            if (destinatario.getNodeType() == Node.ELEMENT_NODE) {
                Element destinatarioElement = (Element) destinatario;

                NodeList identificacionDestinatarioTag = destinatarioElement.getElementsByTagName("identificacionDestinatario");
                Element identificacionDestinatarioElement = (Element) identificacionDestinatarioTag.item(0);
                NodeList identificacionDestinatario = identificacionDestinatarioElement.getChildNodes();
                guiaRemision_destinatarios.setIdentificacionDestinatario(((Node) identificacionDestinatario.item(0)).getNodeValue());

                NodeList razonSocialDestinatarioTag = destinatarioElement.getElementsByTagName("razonSocialDestinatario");
                Element razonSocialDestinatarioElement = (Element) razonSocialDestinatarioTag.item(0);
                NodeList razonSocialDestinatario = razonSocialDestinatarioElement.getChildNodes();
                guiaRemision_destinatarios.setRazonSocialDestinatario(removeAccents(((Node) razonSocialDestinatario.item(0)).getNodeValue()).toLowerCase());

                try {
                    NodeList dirDestinatarioTag = destinatarioElement.getElementsByTagName("dirDestinatario");
                    Element dirDestinatarioElement = (Element) dirDestinatarioTag.item(0);
                    NodeList dirDestinatario = dirDestinatarioElement.getChildNodes();
                    guiaRemision_destinatarios.setDirDestinatario(removeAccents(((Node) dirDestinatario.item(0)).getNodeValue().toLowerCase()));
                } catch (Exception e) {
                }

                try {
                    NodeList motivoTrasladoTag = destinatarioElement.getElementsByTagName("motivoTraslado");
                    Element motivoTrasladoElement = (Element) motivoTrasladoTag.item(0);
                    NodeList motivoTraslado = motivoTrasladoElement.getChildNodes();
                    guiaRemision_destinatarios.setMotivoTraslado(removeAccents(((Node) motivoTraslado.item(0)).getNodeValue().toLowerCase()));
                } catch (Exception e) {
                }

                try {
                    NodeList docAduaneroUnicoTag = destinatarioElement.getElementsByTagName("docAduaneroUnico");
                    Element docAduaneroUnicoElement = (Element) docAduaneroUnicoTag.item(0);
                    NodeList docAduaneroUnico = docAduaneroUnicoElement.getChildNodes();
                    guiaRemision_destinatarios.setDocAduaneroUnico(((Node) docAduaneroUnico.item(0)).getNodeValue());
                } catch (Exception e) {
                }

                try {
                    NodeList codEstabDestinoTag = destinatarioElement.getElementsByTagName("codEstabDestino");
                    Element codEstabDestinoElement = (Element) codEstabDestinoTag.item(0);
                    NodeList codEstabDestino = codEstabDestinoElement.getChildNodes();
                    guiaRemision_destinatarios.setCodEstabDestino(((Node) codEstabDestino.item(0)).getNodeValue());
                } catch (Exception e) {
                }

                try {
                    NodeList rutaTag = destinatarioElement.getElementsByTagName("ruta");
                    Element rutaElement = (Element) rutaTag.item(0);
                    NodeList ruta = rutaElement.getChildNodes();
                    guiaRemision_destinatarios.setRuta(removeAccents(((Node) ruta.item(0)).getNodeValue().toLowerCase()));
                } catch (Exception e) {
                }

                try {
                    NodeList codDocSustentoTag = destinatarioElement.getElementsByTagName("codDocSustento");
                    Element codDocSustentoElement = (Element) codDocSustentoTag.item(0);
                    NodeList codDocSustento = codDocSustentoElement.getChildNodes();
                    guiaRemision_destinatarios.setCodDocSustento(((Node) codDocSustento.item(0)).getNodeValue());
                } catch (Exception e) {
                }

                try {
                    NodeList numDocSustentoTag = destinatarioElement.getElementsByTagName("numDocSustento");
                    Element numDocSustentoElement = (Element) numDocSustentoTag.item(0);
                    NodeList numDocSustento = numDocSustentoElement.getChildNodes();
                    guiaRemision_destinatarios.setNumDocSustento(((Node) numDocSustento.item(0)).getNodeValue());
                } catch (Exception e) {
                }

                try {
                    NodeList numAutDocSustentoTag = destinatarioElement.getElementsByTagName("numAutDocSustento");
                    Element numAutDocSustentoElement = (Element) numAutDocSustentoTag.item(0);
                    NodeList numAutDocSustento = numAutDocSustentoElement.getChildNodes();
                    guiaRemision_destinatarios.setNumAutDocSustento(((Node) numAutDocSustento.item(0)).getNodeValue());
                } catch (Exception e) {
                }

                try {
                    NodeList fechaEmisionDocSustentoTag = destinatarioElement.getElementsByTagName("fechaEmisionDocSustento");
                    Element fechaEmisionDocSustentoElement = (Element) fechaEmisionDocSustentoTag.item(0);
                    NodeList fechaEmisionDocSustento = fechaEmisionDocSustentoElement.getChildNodes();
                    guiaRemision_destinatarios.setFechaEmisionDocSustento(((Node) fechaEmisionDocSustento.item(0)).getNodeValue());
                } catch (Exception e) {
                }

                try {
                    // DETALLES
                    NodeList detallesTag = destinatarioElement.getElementsByTagName("detalles");
                    Element detalles = (Element) detallesTag.item(0);
                    Element detallesElements = (Element) detalles;

                    NodeList detalleTag = detallesElements.getElementsByTagName("detalle");
                    Vector<ecx.unomas.guiaremision.DestinatariosDetalles> guiaremision_destDetalles = new Vector<ecx.unomas.guiaremision.DestinatariosDetalles>();
                    for (int i = 0; i < detalleTag.getLength(); ++i) {
                        ecx.unomas.guiaremision.DestinatariosDetalles guiaremision_destDetalle = new ecx.unomas.guiaremision.DestinatariosDetalles();
                        Node destDetalle = detalleTag.item(i);

                        if (destinatario.getNodeType() == Node.ELEMENT_NODE) {
                            Element destDetalleElement = (Element) destDetalle;

                            NodeList codigoInternoTag = destDetalleElement.getElementsByTagName("codigoInterno");
                            Element codigoInternoElement = (Element) codigoInternoTag.item(0);
                            NodeList codigoInterno = codigoInternoElement.getChildNodes();
                            guiaremision_destDetalle.setCodigoInterno(((Node) codigoInterno.item(0)).getNodeValue());

                            NodeList codigoAdicionalTag = destDetalleElement.getElementsByTagName("codigoAdicional");
                            Element codigoAdicionalElement = (Element) codigoAdicionalTag.item(0);
                            NodeList codigoAdicional = codigoAdicionalElement.getChildNodes();
                            guiaremision_destDetalle.setCodigoAdicional(((Node) codigoAdicional.item(0)).getNodeValue());

                            NodeList descripcionTag = destDetalleElement.getElementsByTagName("descripcion");
                            Element descripcionElement = (Element) descripcionTag.item(0);
                            NodeList descripcion = descripcionElement.getChildNodes();
                            guiaremision_destDetalle.setDescripcion(removeAccents(((Node) descripcion.item(0)).getNodeValue().toLowerCase()));

                            NodeList cantidadTag = destDetalleElement.getElementsByTagName("cantidad");
                            Element cantidadElement = (Element) cantidadTag.item(0);
                            NodeList cantidad = cantidadElement.getChildNodes();
                            guiaremision_destDetalle.setCantidad(Double.parseDouble(((Node) cantidad.item(0)).getNodeValue()));

                            try {
                                // DETALLES ADICIONALES
                                NodeList detallesAdicionalesTag = destDetalleElement.getElementsByTagName("detallesAdicionales");
                                Element detallesAdicionales = (Element) detallesAdicionalesTag.item(0);
                                Element detallesAdicionalesElements = (Element) detallesAdicionales;

                                NodeList detAdicionalTag = detallesAdicionalesElements.getElementsByTagName("detAdicional");
                                Vector<ecx.unomas.guiaremision.DestinatariosDetallesAdicional> detAdicionales = new Vector<ecx.unomas.guiaremision.DestinatariosDetallesAdicional>();
                                for (int da = 0; da < detAdicionalTag.getLength(); ++da) {
                                    ecx.unomas.guiaremision.DestinatariosDetallesAdicional guiaremision_destDetAdicional = new ecx.unomas.guiaremision.DestinatariosDetallesAdicional();
                                    Node detAdicional = detAdicionalTag.item(da);
                                    NamedNodeMap detAdicionalAttr = detAdicional.getAttributes();

                                    Node nombre = detAdicionalAttr.getNamedItem("nombre");
                                    guiaremision_destDetAdicional.setNombre(removeAccents(nombre.getNodeValue().trim().replace(" ", "").toLowerCase()));

                                    Node valor = detAdicionalAttr.getNamedItem("valor");
                                    guiaremision_destDetAdicional.setValor(removeAccents(valor.getNodeValue().trim().toLowerCase()));

                                    detAdicionales.add(guiaremision_destDetAdicional);
                                }
                                guiaremision_destDetalle.setDetAdicional(detAdicionales);
                            } catch (NullPointerException e) {
                                // no tiene detalles adicionales
                            }
                        }
                        guiaremision_destDetalles.add(guiaremision_destDetalle);
                    }
                    guiaRemision_destinatarios.setDetalle(guiaremision_destDetalles);
                } catch (NullPointerException e) {
                    // no tiene detalles 
                }
            }
            guiaRemision.setDestinatarios(guiaRemision_destinatarios);
        }
        try {
            // INFO ADICIONAL
            NodeList infoAdicionalTag = doc.getElementsByTagName("infoAdicional");
            Element infoAdicional = (Element) infoAdicionalTag.item(0);
            Element infoAdicionalElements = (Element) infoAdicional;

            NodeList campoAdicionalTags = infoAdicionalElements.getElementsByTagName("campoAdicional");
            for (int ca = 0; ca < campoAdicionalTags.getLength(); ++ca) {
                ecx.unomas.guiaremision.InfoAdicional guiaremision_infoAdicional = new ecx.unomas.guiaremision.InfoAdicional();
                Node campoAdicional = campoAdicionalTags.item(ca);
                NamedNodeMap campoAdicionalAttr = campoAdicional.getAttributes();

                Node nombre = campoAdicionalAttr.getNamedItem("nombre");
                guiaremision_infoAdicional.setNombre(removeAccents(nombre.getNodeValue().trim().toLowerCase()));

                NodeList valor = campoAdicional.getChildNodes();
                guiaremision_infoAdicional.setValor(removeAccents(((Node) valor.item(0)).getNodeValue().trim().toLowerCase()));

                guiaRemision.setInfAdicional(guiaremision_infoAdicional);
            }
        } catch (NullPointerException e) {
            // no tiene informacion adicional
        }
        return guiaRemision;
    }

    private String removeAccents(String str) {
        return str.replace("�", "a").replace("�", "e").replace("�", "i").replace("�", "o").replace("�", "u").replace("�", "n").toUpperCase();
    }
}
