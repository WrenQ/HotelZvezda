// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package iw.zvezdahotels;

import iw.zvezdahotels.Booking;
import iw.zvezdahotels.BookingDataOnDemand;
import iw.zvezdahotels.BookingIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect BookingIntegrationTest_Roo_IntegrationTest {
    
    declare @type: BookingIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: BookingIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: BookingIntegrationTest: @Transactional;
    
    @Autowired
    BookingDataOnDemand BookingIntegrationTest.dod;
    
    @Test
    public void BookingIntegrationTest.testCountBookings() {
        Assert.assertNotNull("Data on demand for 'Booking' failed to initialize correctly", dod.getRandomBooking());
        long count = Booking.countBookings();
        Assert.assertTrue("Counter for 'Booking' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void BookingIntegrationTest.testFindBooking() {
        Booking obj = dod.getRandomBooking();
        Assert.assertNotNull("Data on demand for 'Booking' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Booking' failed to provide an identifier", id);
        obj = Booking.findBooking(id);
        Assert.assertNotNull("Find method for 'Booking' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Booking' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void BookingIntegrationTest.testFindAllBookings() {
        Assert.assertNotNull("Data on demand for 'Booking' failed to initialize correctly", dod.getRandomBooking());
        long count = Booking.countBookings();
        Assert.assertTrue("Too expensive to perform a find all test for 'Booking', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Booking> result = Booking.findAllBookings();
        Assert.assertNotNull("Find all method for 'Booking' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Booking' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void BookingIntegrationTest.testFindBookingEntries() {
        Assert.assertNotNull("Data on demand for 'Booking' failed to initialize correctly", dod.getRandomBooking());
        long count = Booking.countBookings();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Booking> result = Booking.findBookingEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Booking' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Booking' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void BookingIntegrationTest.testFlush() {
        Booking obj = dod.getRandomBooking();
        Assert.assertNotNull("Data on demand for 'Booking' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Booking' failed to provide an identifier", id);
        obj = Booking.findBooking(id);
        Assert.assertNotNull("Find method for 'Booking' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyBooking(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Booking' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void BookingIntegrationTest.testMergeUpdate() {
        Booking obj = dod.getRandomBooking();
        Assert.assertNotNull("Data on demand for 'Booking' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Booking' failed to provide an identifier", id);
        obj = Booking.findBooking(id);
        boolean modified =  dod.modifyBooking(obj);
        Integer currentVersion = obj.getVersion();
        Booking merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Booking' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void BookingIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Booking' failed to initialize correctly", dod.getRandomBooking());
        Booking obj = dod.getNewTransientBooking(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Booking' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Booking' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'Booking' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void BookingIntegrationTest.testRemove() {
        Booking obj = dod.getRandomBooking();
        Assert.assertNotNull("Data on demand for 'Booking' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Booking' failed to provide an identifier", id);
        obj = Booking.findBooking(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Booking' with identifier '" + id + "'", Booking.findBooking(id));
    }
    
}
