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
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        PreparedStatement preparedStatement = null;
        try {
            String query = "DELETE FROM Magacin WHERE IDMagacin = ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idMagacin);
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
    public int izmeniSefaZaMagacin(int idMagacin, int idSefNovo) {
       CallableStatement callableStatement = null; 
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        
        try {
            String query = "{? = CALL IzmeniSefa(?, ?) }";
            Connection connection = DB.getConnection();
            
            callableStatement = connection.prepareCall(query);
            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            callableStatement.setInt(2, idMagacin);
            callableStatement.setInt(3, idSefNovo);
            callableStatement.execute();
            
            return OK_CODE;
            
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
    public int izmeniPlatuZaMagacin(int idMagacin, BigDecimal plataNovo) {
          PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        
        try {
            String query = "UPDATE Magacin SET Plata= ? WHERE IDMagacin=?";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setBigDecimal(1, plataNovo);
            preparedStatement.setInt(2, idMagacin);
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
    public int isplatiPlateZaposlenimaUSvimMagacinima() {
        CallableStatement callableStatement = null; 
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        
        try {
            String query = "{? = CALL IsplatiUSvimMagacinima() }";
            Connection connection = DB.getConnection();
            
            callableStatement = connection.prepareCall(query);
            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            callableStatement.execute();
            
            return OK_CODE;
            
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
    public int isplatiPlateZaposlenimaUMagacinu(int idMagacin) {
         CallableStatement callableStatement = null; 
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        
        try {
            String query = "{? = CALL IsplatiZaposlenogUMagacinu(?) }";
            Connection connection = DB.getConnection();
            
            callableStatement = connection.prepareCall(query);
            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            callableStatement.setInt(2, idMagacin);
            callableStatement.execute();
            
            return OK_CODE;
            
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
        CallableStatement callableStatement = null; 
        final BigDecimal ERROR_CODE = new BigDecimal(-1);
        
        try {
            String query = "{? = CALL UzmiRobuIzMagacinPoKol(?, ?, ?) }";
            Connection connection = DB.getConnection();
            
            callableStatement = connection.prepareCall(query);
            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            callableStatement.setInt(2, idRoba);
            callableStatement.setInt(3, idMagacin);
            callableStatement.setBigDecimal(4, kolicina);
            callableStatement.execute();
            
            BigDecimal retVal = callableStatement.getBigDecimal(1);
            return retVal;
            
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
    public int uzmiRobuIzMagacinaPoBrojuJedinica(int idRoba, int idMagacin, int brojJedinca) {
        CallableStatement callableStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "{? = CALL UzmiRobuIzMagacinPoJed(?, ?, ?) }";
            Connection connection = DB.getConnection();
            
            callableStatement = connection.prepareCall(query);
            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            callableStatement.setInt(2, idRoba);
            callableStatement.setInt(3, idMagacin);
            callableStatement.setInt(4, brojJedinca);
            callableStatement.execute();
            
            int retVal = callableStatement.getInt(1);
            return retVal;
            
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
    public BigDecimal pogledajKolicinuRobeUMagacinu(int idRoba, int idMagacin) {
         final BigDecimal ERROR_CODE = new BigDecimal(-1);
        PreparedStatement preparedStatement = null;
        try {
            String query = "SELECT Kolicina FROM Ima, ImaKolicine "
                    + "WHERE Ima.IDIma = ImaKolicine.IDIma AND IDMagacin=? "
                    + "AND IDRoba=?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idMagacin);
            preparedStatement.setInt(2, idRoba);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (!resultSet.next())
            {
                return ERROR_CODE;
            }
            return resultSet.getBigDecimal(1);
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
    public int pogledajBrojJedinicaRobeUMagacinu(int idRoba, int idMagacin) {
        final int ERROR_CODE = -1;
        PreparedStatement preparedStatement = null;
        try {
            String query = "SELECT Jedinica FROM Ima, ImaJedinica "
                    + "WHERE Ima.IDIma = ImaJedinica.IDIma AND IDMagacin=? "
                    + "AND IDRoba=?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idMagacin);
            preparedStatement.setInt(2, idRoba);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (!resultSet.next())
            {
                return ERROR_CODE;
            }
            return resultSet.getInt(1);
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
        final List<Integer> ERROR_CODE = null;
        PreparedStatement preparedStatement = null;
        try {
            String query = "SELECT IDRoba Id FROM Roba";
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
        CallableStatement callableStatement = null; 
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        
        try {
            String query = "{? = CALL ZaposleniNeRadiUMag(?) }";
            Connection connection = DB.getConnection();
            
            callableStatement = connection.prepareCall(query);
            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            callableStatement.setInt(2, idZaposleni);
            
            callableStatement.execute();
            return OK_CODE;
            
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
    public int zaposleniZaduzujeOpremu(int idZaposlenogKojiZaduzuje, int idMagacin, int idRoba, Date datumZaduzenja, String napomena) {
         CallableStatement callableStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "{? = CALL ZaposleniZaduzi(?, ?, ?, ?, ?) }";
            Connection connection = DB.getConnection();
            
            callableStatement = connection.prepareCall(query);
            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            callableStatement.setInt(2, idZaposlenogKojiZaduzuje);
            callableStatement.setInt(3, idMagacin);
            callableStatement.setInt(4, idRoba);
            callableStatement.setDate(5, datumZaduzenja);
            callableStatement.setString(6, napomena);
            
            callableStatement.execute();
            
            if (ERROR_CODE != callableStatement.getInt(1))
            {
                return callableStatement.getInt(1);
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
    public int zaposleniRazduzujeOpremu(int idZaduzenjaOpreme, Date datumRazduzenja) {
         CallableStatement callableStatement = null; 
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        
        try {
            String query = "{? = CALL ZaposleniRazduzi(?, ?) }";
            Connection connection = DB.getConnection();
            
            callableStatement = connection.prepareCall(query);
            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            callableStatement.setInt(2, idZaduzenjaOpreme);
            callableStatement.setDate(3, datumRazduzenja);
            
            callableStatement.execute();
            return OK_CODE;
            
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
        final BigDecimal ERROR_CODE = new BigDecimal(-1);
        PreparedStatement preparedStatement = null;
        try {
            String query = "SELECT Plata FROM Norma WHERE IDNorma = ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idNR);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (!resultSet.next())
            {
                return ERROR_CODE;
            }
            return resultSet.getBigDecimal("Plata");
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
         final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        PreparedStatement preparedStatement = null;
        try {
            String query = "DELETE FROM Sadrzi WHERE IDROba = ? AND IDNorma=?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idRobaKojaJePotrosniMaterijal);
            preparedStatement.setInt(2, idNormaUgradnogDela);
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
    public int unesiPosao(int idNormaUgradnogDela, int idSprat, Date datumPocetka) {
        
         CallableStatement callableStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "{? = CALL InsertPosao(?, ?, ?) }";
            Connection connection = DB.getConnection();
            
            callableStatement = connection.prepareCall(query);
            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            callableStatement.setInt(2, idNormaUgradnogDela);
            callableStatement.setInt(3, idSprat);
            callableStatement.setDate(4, datumPocetka);
            callableStatement.execute();
            
            int retVal = callableStatement.getInt(1);
            return retVal;
            
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
    public int obrisiPosao(int idPosao) {
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        CallableStatement callableStatement = null;
        
        try {
            String query = "{?=CALL DeletePosao(?) }";
            Connection connection = DB.getConnection();
            
            callableStatement = connection.prepareCall(query);
            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            callableStatement.setInt(2, idPosao);
            callableStatement.execute();
            
            return OK_CODE;
            
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
    public int izmeniDatumPocetkaZaPosao(int idPosao, Date datumPocetka) {
         PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        
        try {
            String query = "UPDATE Posao " 
                            + " SET DatumPocetka = ? "
                    + "WHERE IDposao=?";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setDate(1, datumPocetka);
            preparedStatement.setInt(2, idPosao);
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
    public int zavrsiPosao(int idPosao, Date datumKraja) {
         CallableStatement callableStatement = null;
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        
        try {
            String query = "{? = CALL ZavrsiRadIDajPlateIZavrsiPosao(?, ?) }";
            Connection connection = DB.getConnection();
            callableStatement = connection.prepareCall(query);
            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            callableStatement.setInt(2, idPosao);
            callableStatement.setDate(3, datumKraja);
            callableStatement.execute();
            return OK_CODE;
            
        } catch (SQLException ex) {
                Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
            return ERROR_CODE;
        }
        finally{
             try {
                 callableStatement.close();
             } catch (SQLException ex) {
                 Logger.getLogger(Zd130033.class.getName()).log(Level.SEVERE, null, ex);
                 return ERROR_CODE;
             }
        }
    }

    @Override
    public int zaposleniRadiNaPoslu(int idZaposleni, int idPosao, Date datumPocetka) {
          PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "INSERT INTO Rad (IDPosao, IDZaposleni,"
                    + "DatumPocetka, DatumKraja)" 
                            + "VALUES ( ?, ?, ?, NULL)";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, idPosao);
            preparedStatement.setInt(2, idZaposleni);
            preparedStatement.setDate(3, datumPocetka);
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
    public int zaposleniJeZavrsioSaRadomNaPoslu(int idZaposleniNaPoslu, Date datumKraja) {
         PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        
        try {
            String query = "UPDATE RAD " 
                            + " SET DatumKraja = ? "
                    + "WHERE IDRad=?";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setDate(1, datumKraja);
            preparedStatement.setInt(2, idZaposleniNaPoslu);
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
    public int izmeniDatumPocetkaRadaZaposlenogNaPoslu(int idZaposleniNaPoslu, Date datumPocetkaNovo) {
        PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        
        try {
            String query = "UPDATE RAD " 
                            + " SET DatumPocetka = ? "
                    + "WHERE IDRad=?";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setDate(1, datumPocetkaNovo);
            preparedStatement.setInt(2, idZaposleniNaPoslu);
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
    public int izmeniDatumKrajaRadaZaposlenogNaPoslu(int idZaposleniNaPoslu, Date datumKrajaNovo) {
         PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        
        try {
            String query = "UPDATE RAD " 
                            + " SET DatumKraja = ? "
                    + "WHERE IDRad=?";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setDate(1, datumKrajaNovo);
            preparedStatement.setInt(2, idZaposleniNaPoslu);
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
    public int zaposleniDobijaOcenu(int idZaposleniNaPoslu, int ocena) {
         PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = -1;
        
        try {
            String query = "INSERT INTO Ocena (IDRad, Ocena)" 
                            + "VALUES ( ?, ?)";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, idZaposleniNaPoslu);
            preparedStatement.setInt(2, ocena);
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
    public int obrisiOcenuZaposlenom(int idZaposleniNaPoslu) {
          final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        PreparedStatement preparedStatement = null;
        try {
            String query = "DELETE FROM Ocena WHERE IDRad = ?";
            Connection connection = DB.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idZaposleniNaPoslu);
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
    public int izmeniOcenuZaZaposlenogNaPoslu(int idZaposleniNaPoslu, int ocenaNovo) {
         PreparedStatement preparedStatement = null; 
        final int ERROR_CODE = 1;
        final int OK_CODE = 0;
        
        try {
            String query = "UPDATE Ocena SET Ocena= ? WHERE IDRad=?";
            Connection connection = DB.getConnection();
            
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, ocenaNovo);
            preparedStatement.setInt(2, idZaposleniNaPoslu);
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
    
}
