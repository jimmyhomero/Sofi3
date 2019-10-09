-- MySQL dump 10.14  Distrib 5.5.52-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: r_diser
-- ------------------------------------------------------
-- Server version	5.5.52-MariaDB
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `r_diser`.`KARDEX_ACTUALIZAR_STOCKS` BEFORE INSERT ON `r_diser`.`kardex` 
    FOR EACH ROW CASE 
     WHEN NEW.K_BODEGA_ID= '0' THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , CANTIDAD=CANTIDAD- 
NEW.K_SALIDA_CANTIDAD + NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO; 
     WHEN NEW.K_BODEGA_ID= '1'  THEN   UPDATE `r_diser`.`PRODUCTOS` SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B1=B1 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO; 
     WHEN NEW.K_BODEGA_ID= '2'   THEN   UPDATE `r_diser`.`PRODUCTOS` SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B2=B2 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO; 
     WHEN NEW.K_BODEGA_ID= '3'   THEN   UPDATE `r_diser`.`PRODUCTOS` SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B3=B3 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO;  
     WHEN NEW.K_BODEGA_ID= '4'   THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B4=B4 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO;  
     WHEN NEW.K_BODEGA_ID= '5'   THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B5=B5 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO;  
     WHEN NEW.K_BODEGA_ID= '6'   THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B6=B6 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO;  
     WHEN NEW.K_BODEGA_ID= '7'   THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B7=B7 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO;  
     WHEN NEW.K_BODEGA_ID= '8'   THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B8=B8 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO;  
     WHEN NEW.K_BODEGA_ID= '9'   THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B9=B9 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO;  
     WHEN NEW.K_BODEGA_ID= '10'   THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B10=B10 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO; 
     WHEN NEW.K_BODEGA_ID= '11'   THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B11=B11 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO;  
     WHEN NEW.K_BODEGA_ID= '12'   THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B12=B12 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO;  
     WHEN NEW.K_BODEGA_ID= '13'   THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B13=B13 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO;  
     WHEN NEW.K_BODEGA_ID= '14'   THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B14=B14 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO;  
     WHEN NEW.K_BODEGA_ID= '15'   THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B15=B15 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO;  
     WHEN NEW.K_BODEGA_ID= '16'   THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B16=B16 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO;  
     WHEN NEW.K_BODEGA_ID= '17'   THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B17=B17 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO;  
     WHEN NEW.K_BODEGA_ID= '18'   THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B18=B18 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO;  
     WHEN NEW.K_BODEGA_ID= '19'   THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B19=B19 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO;  
     WHEN NEW.K_BODEGA_ID= '20'   THEN   UPDATE `r_diser`.`PRODUCTOS`  SET sync= DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')  , B20=B20 - NEW.K_SALIDA_CANTIDAD + 
NEW.K_ENTRADA_CANTIDAD WHERE codigo=NEW.K_ID_PRODUCTO;  
     WHEN NEW.K_BODEGA_ID= '777' THEN SET NEW.K_SALDOS_CANTIDAD=NEW.K_SALDOS_CANTIDAD + 
NEW.K_SALIDA_cANTIDAD - NEW.K_ENTRADA_CANTIDAD; SET NEW.K_SALDOS_COSTO=NEW.K_SALDOS_cANTIDAD * 
NEW.K_COSTO_UNITARIO; SET NEW.K_SALDOS_PVP=NEW.K_SALDOS_cANTIDAD * NEW.K_PVP_UNITARIO;
 END CASE */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `r_diser`.`SAT_SALDOS_REFRESCAR` AFTER INSERT ON `r_diser`.`sat_repuestos`   FOR EACH ROW  UPDATE `r_diser`.`sat_ordenes` SET sating_monto=NEW.fac_monto WHERE sating_id=NEW.fac_orden_in */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'r_diser'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-26 11:16:47
