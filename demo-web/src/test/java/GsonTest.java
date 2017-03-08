import com.echo.model.Appointment;
import com.echo.model.Book;
import com.google.gson.Gson;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Echo on 2017-03-08.
 */
public class GsonTest {

    Logger logger= LoggerFactory.getLogger(this.getClass());

    @Test
    public  void testGson(){
        List<Appointment> appointments=new ArrayList<Appointment>();

        Appointment app1=new Appointment();
        app1.setAppointmentId(23L);
        app1.setBook(new Book());



        appointments.add(app1);

        Gson gson=new Gson();

        String jsonStr=gson.toJson(appointments);
        logger.debug(jsonStr);




    }
}
