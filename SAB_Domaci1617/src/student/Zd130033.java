/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package student;

import funkcionalnosti.Funkcionalnosti;
import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import student.util.DB;

/**
 *
 * @author stefan
 */
public class Zd130033 extends Funkcionalnosti{

    @Override
    public int unesiGradiliste(String naziv, Date datumOsnivanja) {
        PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "INSERT INTO Gradiliste (Naziv, DatumOsnivanja, BrojObjekata)" 
                            + "VALUES ( ?, ?, 0)";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, naziv);
            preparedStatement.setDate(2, datumOsnivanja);
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next())
            {
                return resultSet.getInt(1);
            }
            else
            {
                return ERROR_CODE;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int obrisiGradiliste(int idGradiliste) {
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        PreparedStatement preparedStatement = null;
        try {
            String query = "DELETE FROM Gradiliste WHERE IDGradiliste = ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idGradiliste);
            preparedStatement.executeUpdate();
            return OK_CODE;
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public List<Integer> dohvatiSvaGradilista() {
        final List<Integer> ERROR_CODE = null;
        PreparedStatement preparedStatement = null;
        try {
            String query = "SELECT IDGradiliste Id FROM Gradiliste";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            LinkedList <Integer> listIdGrad = new LinkedList<>();
            while (resultSet.next())
            {
                listIdGrad.addLast(resultSet.getInt("Id"));
            }
            if (listIdGrad.isEmpty())
            {
                return ERROR_CODE;
            }
            return listIdGrad;
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int unesiObjekat(String naziv, int idGradiliste) {
         PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "INSERT INTO Objekat (Naziv, IDGradiliste, BrojSpratova)" 
                            + "VALUES ( ?, ?, 0)";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, naziv);
            preparedStatement.setInt(2, idGradiliste);
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next())
            {
                return resultSet.getInt(1);
            }
            else
            {
                return ERROR_CODE;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int obrisiObjekat(int idObjekat) {
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        PreparedStatement preparedStatement = null;
        try {
            String query = "DELETE FROM Objekat WHERE IDObjekat = ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idObjekat);
            preparedStatement.executeUpdate();
            return OK_CODE;
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
        
    }
    
    private int brojSpratova(int idObjekat)
    {
        PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "SELECT BrojSpratova brSpratova FROM Objekat WHERE IDObjekat = ?";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idObjekat);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next())
            {
                return resultSet.getInt("brSpratova");
            }
            else
            {
                return ERROR_CODE;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int unesiSprat(int brSprata, int idObjekat) {
        PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = -1;
        int brojSpratovaObjekta = brojSpratova(idObjekat);
        if (brojSpratovaObjekta != brSprata)
        {
            return ERROR_CODE;
        }
        
        try {
            String query = "INSERT INTO Sprat (RedniBroj, IDObjekat)" 
                            + "VALUES ( ?, ?)";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, brSprata);
            preparedStatement.setInt(2, idObjekat);
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next())
            {
                return resultSet.getInt(1);
            }
            else
            {
                return ERROR_CODE;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int obrisiSprat(int idSprat) {
         final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        PreparedStatement preparedStatement = null;
        try {
            String query = "DELETE FROM Sprat WHERE IDSprat = ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idSprat);
            preparedStatement.executeUpdate();
            return OK_CODE;
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int unesiZaposlenog(String ime, String prezime, String jmbg, String pol, String ziroRacun, String email, String brojTelefona) {
        PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = -1;
        try {
            String query = "INSERT INTO Zaposleni(Ime, Prezime, JMBG, ZiroRacun, "
                    + "Email, BrojTelefona, ProsecnaOcena, BrojZaduzeneOpreme, "
                    + "IsplaceniIznos, IDMagacin, Pol) "
                    + "VALUES (?, ?, ?, ?, ?, ?, 10, 0, 0, "
                    + "NULL, ?)";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, ime);
            preparedStatement.setString(2, prezime);
            preparedStatement.setString(3, jmbg);
            preparedStatement.setString(4, ziroRacun);
            preparedStatement.setString(5, email);
            preparedStatement.setString(6, brojTelefona);
            preparedStatement.setString(7, pol);
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next())
            {
                return resultSet.getInt(1);
            }
            else
            {
                return ERROR_CODE;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int obrisiZaposlenog(int idZaposleni) {
         final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        PreparedStatement preparedStatement = null;
        try {
            String query = "DELETE FROM Zaposleni WHERE IDZaposleni = ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idZaposleni);
            preparedStatement.executeUpdate();
            return OK_CODE;
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public BigDecimal dohvatiUkupanIsplacenIznosZaZaposlenog(int idZaposleni) {
         final BigDecimal ERROR_CODE = new BigDecimal(-1.0);
        PreparedStatement preparedStatement = null;
        try {
            String query = "SELECT IsplaceniIznos iznos FROM Zaposleni "
                    + "WHERE IDZaposleni= ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idZaposleni);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (!resultSet.next())
            {
                return ERROR_CODE;
            }
            else
            {
                return resultSet.getBigDecimal("iznos");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override   
    public BigDecimal dohvatiProsecnuOcenuZaZaposlenog(int idZaposleni) {
         final BigDecimal ERROR_CODE = new BigDecimal(-1.0);
        PreparedStatement preparedStatement = null;
        try {
            String query = "SELECT ProsecnaOcena prosecna FROM Zaposleni "
                    + "WHERE IDZaposleni= ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idZaposleni);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (!resultSet.next())
            {
                return ERROR_CODE;
            }
            else
            {
                return resultSet.getBigDecimal("prosecna");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int dohvatiBrojTrenutnoZaduzeneOpremeZaZaposlenog(int idZaposleni) {
        final int ERROR_CODE = -1;
        PreparedStatement preparedStatement = null;
        try {
            String query = "SELECT BrojZaduzeneOpreme zaduzen FROM Zaposleni "
                    + "WHERE IDZaposleni= ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idZaposleni);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (!resultSet.next())
            {
                return ERROR_CODE;
            }
            else
            {
                return resultSet.getInt("zaduzen");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public List<Integer> dohvatiSveZaposlene() {
         final List<Integer> ERROR_CODE = null;
        PreparedStatement preparedStatement = null;
        try {
            String query = "SELECT IDZaposleni Id FROM Zaposleni";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            LinkedList <Integer> listIdGrad = new LinkedList<>();
            while (resultSet.next())
            {
                listIdGrad.addLast(resultSet.getInt("Id"));
            }
            if (listIdGrad.isEmpty())
            {
                return ERROR_CODE;
            }
            return listIdGrad;
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int unesiMagacin(int idSef, BigDecimal plata, int idGradiliste) {
       CallableStatement callableStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "{? = CALL InsertMagacin(?, ?, ?) }";
            Connection connection = DB.getConnection();
            
            callableStatement = connection.prepareCall(query);
            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            callableStatement.setInt(2, idGradiliste);
            callableStatement.setInt(3, idSef);
            callableStatement.setBigDecimal(4, plata);
            callableStatement.execute();
            
            int retVal = callableStatement.getInt(1);
            if (ERROR_CODE != retVal)
            {
                return retVal;
            }
            else 
            {
                return ERROR_CODE;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (callableStatement != null)
            {
                try {
                    callableStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int obrisiMagacin(int idMagacin) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int izmeniSefaZaMagacin(int idMagacin, int idSefNovo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int izmeniPlatuZaMagacin(int idMagacin, BigDecimal plataNovo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int isplatiPlateZaposlenimaUSvimMagacinima() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int isplatiPlateZaposlenimaUMagacinu(int idMagacin) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int unesiRobuUMagacinPoKolicini(int idRoba, int idMagacin, BigDecimal kolicina) {
         CallableStatement callableStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "{? = CALL InsertImaKolicina(?, ?, ?) }";
            Connection connection = DB.getConnection();
            
            callableStatement = connection.prepareCall(query);
            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            callableStatement.setInt(2, idMagacin);
            callableStatement.setInt(3, idRoba);
            callableStatement.setBigDecimal(4, kolicina);
            callableStatement.execute();
            
            int retVal = callableStatement.getInt(1);
            if (ERROR_CODE != retVal)
            {
                return retVal;
            }
            else 
            {
                return ERROR_CODE;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (callableStatement != null)
            {
                try {
                    callableStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int unesiRobuUMagacinPoBrojuJedinica(int idRoba, int idMagacin, int brojJedinica) {
         CallableStatement callableStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "{? = CALL InsertImaJedinica(?, ?, ?) }";
            Connection connection = DB.getConnection();
            
            callableStatement = connection.prepareCall(query);
            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            callableStatement.setInt(2, idMagacin);
            callableStatement.setInt(3, idRoba);
            callableStatement.setInt(4, brojJedinica);
            callableStatement.execute();
            
            int retVal = callableStatement.getInt(1);
            if (ERROR_CODE != retVal)
            {
                return retVal;
            }
            else 
            {
                return ERROR_CODE;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (callableStatement != null)
            {
                try {
                    callableStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public BigDecimal uzmiRobuIzMagacinaPoKolicini(int idRoba, int idMagacin, BigDecimal kolicina) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int uzmiRobuIzMagacinaPoBrojuJedinica(int idRoba, int idMagacin, int brojJedinca) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BigDecimal pogledajKolicinuRobeUMagacinu(int idRoba, int idMagacin) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int pogledajBrojJedinicaRobeUMagacinu(int idRoba, int idMagacin) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    private static final String HTZ_NAME = "HTZ";
    private static final String ALAT_NAME = "alat";
    private static final String MAT_NAME = "materijal";
    
    
    @Override
    public int unesiTipRobe(String naziv) {
        PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "INSERT INTO TipRobe (Naziv)"
                    + " VALUES(?)";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, naziv);
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next())
            {
                return resultSet.getInt(1);
            }
            else
            {
                return ERROR_CODE;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int obrisiTipRobe(int idTipRobe) {
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        PreparedStatement preparedStatement = null;
        try {
            String query = "DELETE FROM TipRobe WHERE IDTipRobe = ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idTipRobe);
            preparedStatement.executeUpdate();
            return OK_CODE;
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int unesiRobu(String naziv, String kod, int idTipRobe) {
        PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "INSERT INTO Roba (Naziv, IDTipRobe, Kod)"
                    + " VALUES(?, ?, ?)";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, naziv);
            preparedStatement.setInt(2, idTipRobe);
            preparedStatement.setString(3, kod);
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next())
            {
                return resultSet.getInt(1);
            }
            else
            {
                return ERROR_CODE;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int obrisiRobu(int idRoba) {
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        PreparedStatement preparedStatement = null;
        try {
            String query = "DELETE FROM Roba WHERE IDRoba = ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idRoba);
            preparedStatement.executeUpdate();
            return OK_CODE;
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public List<Integer> dohvatiSvuRobu() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int zaposleniRadiUMagacinu(int idZaposleni, int idMagacin) {
        CallableStatement callableStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "{? = CALL ZaposliUMagacin(?, ?) }";
            Connection connection = DB.getConnection();
            
            callableStatement = connection.prepareCall(query);
            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            callableStatement.setInt(2, idZaposleni);
            callableStatement.setInt(3, idMagacin);
            callableStatement.execute();
            
            if (ERROR_CODE != callableStatement.getInt(1))
            {
                return idZaposleni;
            }
            else 
            {
                return ERROR_CODE;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (callableStatement != null)
            {
                try {
                    callableStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int zaposleniNeRadiUMagacinu(int idZaposleni) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int zaposleniZaduzujeOpremu(int idZaposlenogKojiZaduzuje, int idMagacin, int idRoba, Date datumZaduzenja, String napomena) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int zaposleniRazduzujeOpremu(int idZaduzenjaOpreme, Date datumRazduzenja) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int unesiNormuUgradnogDela(String naziv, BigDecimal cenaIzrade, BigDecimal jedinicnaPlataRadnika) {
         PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "INSERT INTO Norma (Naziv, Cena, Plata)" 
                            + "VALUES ( ?, ?, ?)";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, naziv);
            preparedStatement.setBigDecimal(2, cenaIzrade);
            preparedStatement.setBigDecimal(3, jedinicnaPlataRadnika);
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next())
            {
                return resultSet.getInt(1);
            }
            else
            {
                return ERROR_CODE;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int obrisiNormuUgradnogDela(int idNormaUgradnogDela) {
                final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        PreparedStatement preparedStatement = null;
        try {
            String query = "DELETE FROM Norma WHERE IDNorma = ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idNormaUgradnogDela);
            preparedStatement.executeUpdate();
            return OK_CODE;
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (preparedStatement != null)
            {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public BigDecimal dohvatiJedinicnuPlatuRadnikaNormeUgradnogDela(int idNR) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int unesiPotrebanMaterijalPoBrojuJedinica(int idRobaKojaJePotrosniMaterijal, int idNormaUgradnogDela, int brojJedinica) {
         CallableStatement callableStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "{? = CALL InsertSadrziJedinica(?, ?, ?) }";
            Connection connection = DB.getConnection();
            
            callableStatement = connection.prepareCall(query);
            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            callableStatement.setInt(2, idRobaKojaJePotrosniMaterijal);
            callableStatement.setInt(3, idNormaUgradnogDela);
            callableStatement.setInt(4, brojJedinica);
            callableStatement.execute();
            
            int retVal = callableStatement.getInt(1);
            if (ERROR_CODE != retVal)
            {
                return retVal;
            }
            else 
            {
                return ERROR_CODE;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (callableStatement != null)
            {
                try {
                    callableStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int unesiPotrebanMaterijalPoKolicini(int idRobaKojaJePotrosniMaterijal, int idNormaUgradnogDela, BigDecimal kolicina) {
         CallableStatement callableStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "{? = CALL InsertSadrziKolicina(?, ?, ?) }";
            Connection connection = DB.getConnection();
            
            callableStatement = connection.prepareCall(query);
            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            callableStatement.setInt(2, idRobaKojaJePotrosniMaterijal);
            callableStatement.setInt(3, idNormaUgradnogDela);
            callableStatement.setBigDecimal(4, kolicina);
            callableStatement.execute();
            
            int retVal = callableStatement.getInt(1);
            if (ERROR_CODE != retVal)
            {
                return retVal;
            }
            else 
            {
                return ERROR_CODE;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally
        {
            if (callableStatement != null)
            {
                try {
                    callableStatement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                    return ERROR_CODE;
                }
            }
        }
    }

    @Override
    public int obrisiPotrebanMaterijal(int idRobaKojaJePotrosniMaterijal, int idNormaUgradnogDela) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int unesiPosao(int idNormaUgradnogDela, int idSprat, Date datumPocetka) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int obrisiPosao(int idPosao) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int izmeniDatumPocetkaZaPosao(int idPosao, Date datumPocetka) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int zavrsiPosao(int idPosao, Date datumKraja) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int zaposleniRadiNaPoslu(int idZaposleni, int idPosao, Date datumPocetka) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int zaposleniJeZavrsioSaRadomNaPoslu(int idZaposleniNaPoslu, Date datumKraja) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int izmeniDatumPocetkaRadaZaposlenogNaPoslu(int idZaposleniNaPoslu, Date datumPocetkaNovo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int izmeniDatumKrajaRadaZaposlenogNaPoslu(int idZaposleniNaPoslu, Date datumKrajaNovo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int zaposleniDobijaOcenu(int idZaposleniNaPoslu, int ocena) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int obrisiOcenuZaposlenom(int idZaposleniNaPoslu) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int izmeniOcenuZaZaposlenogNaPoslu(int idZaposleniNaPoslu, int ocenaNovo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
