package com.angel.musicacademy;

import com.angel.musicacademy.model.Admin;
import com.angel.musicacademy.model.BatchTime;
import com.angel.musicacademy.model.Branch;
import com.angel.musicacademy.model.Course;
import com.angel.musicacademy.model.Event;
import com.angel.musicacademy.model.EventApplication;
import com.angel.musicacademy.model.Exam;
import com.angel.musicacademy.model.ExamApplication;
import com.angel.musicacademy.model.Instrument;
import com.angel.musicacademy.model.InstrumentSubcategory;
import com.angel.musicacademy.model.PhotosVideos;
import com.angel.musicacademy.model.Product;
import com.angel.musicacademy.model.Purchase;
import com.angel.musicacademy.model.Subject;
import com.angel.musicacademy.model.User;
import com.angel.musicacademy.service.AdminService;
import com.angel.musicacademy.service.DynamicGenerator;
import com.angel.musicacademy.service.UserService;
import com.angel.musicacademy.service.impl.SendMail;
import com.angel.musicacademy.service.impl.SendMessage;
import com.angel.musicacademy.util.Cons;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

    private static final Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private HttpSession httpSession;

    @Autowired
    private UserService userService;

    @Autowired
    private AdminService adminService;

    @Autowired
    ServletContext context;

    @Autowired
    private DynamicGenerator dynamicGenerator;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("DD-MMMM-YYYY hh:mm aa");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

    private static BufferedImage resizeImage(BufferedImage originalImage, int type, int IMG_WIDTH, int IMG_HEIGHT) {
        BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
        Graphics2D g = resizedImage.createGraphics();
        g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
        g.dispose();

        return resizedImage;
    }

    @RequestMapping(value = "adminLogout", method = RequestMethod.GET)
    public ModelAndView getAdminLogout() {
        httpSession.removeAttribute("BRANCH_ADMIN");
        httpSession.invalidate();
        return new ModelAndView("redirect:index");
    }

    @RequestMapping(value = "adminLogin", method = RequestMethod.GET)
    public ModelAndView getAdminLoginPage(@ModelAttribute Admin admin) {
        return new ModelAndView("admin/adminLogin");
    }

    @RequestMapping(value = "branchAdminIndex", method = RequestMethod.GET)
    public ModelAndView branchAdminIndex() {
        List<Instrument> instruments = adminService.getAllInstruments();
        ModelAndView modelAndView = new ModelAndView("branchAdmin/branchAdminIndex");
        modelAndView.addObject("instruments", instruments);
        List<Event> events = adminService.getAllEvents();
        modelAndView.addObject("events", events);

        return modelAndView;
    }
    
     @RequestMapping(value = "branchReceptionIndex", method = RequestMethod.GET)
    public ModelAndView branchReceptionIndex() {
        List<Instrument> instruments = adminService.getAllInstruments();
        ModelAndView modelAndView = new ModelAndView("branchReception/branchReceptionIndex");
        modelAndView.addObject("instruments", instruments);
        List<Event> events = adminService.getAllEvents();
        modelAndView.addObject("events", events);

        return modelAndView;
    }

    @RequestMapping(value = "authonticateAdmin", method = RequestMethod.POST)
    public ModelAndView authonticateAdmin(@ModelAttribute Admin admin) {
        logger.info("Authonticating Admin: " + admin.getAdminEmail());
       Admin a=adminService.getReceptionByReceptionEmailAndPassword(admin);;
        logger.info("Authonticating Admin2: " + a); 
//        String Adminemail=admin.getAdminEmail();
//        String ReceptionPassword=admin.getReceptionPassword();
//        a.setAdminEmail(Adminemail);
//        a.setReceptionPassword(ReceptionPassword);
//        Admin b=new Admin();
//        b= adminService.getReceptionByReceptionEmailAndPassword(a);
//      
     
        admin = adminService.getAdminByAdminEmailAndPassword(admin);
        logger.info("Authonticating Admin1: " + admin);
        logger.info("Authonticating Admin2: " + a);
        String msg = "Invalid Credentials...!!!";
       

        if (admin != null) {
            if (admin.getAdminOfBranch() == null) {
                logger.info("Authonticating Admin: " + admin.getAdminName());
                httpSession.setAttribute("BRANCH_ADMIN", admin);
                List<Instrument> instruments = adminService.getAllInstruments();
                ModelAndView modelAndView = new ModelAndView("admin/superAdminIndex");
                modelAndView.addObject("instruments", instruments);
                List<Event> events = adminService.getAllEvents();
                modelAndView.addObject("events", events);
                return modelAndView;
            }
            httpSession.setAttribute("BRANCH_ADMIN", admin);
            List<Instrument> instruments = adminService.getAllInstruments();
            ModelAndView modelAndView = new ModelAndView("branchAdmin/branchAdminIndex");
            modelAndView.addObject("instruments", instruments);
            List<Event> events = adminService.getAllEvents();
            modelAndView.addObject("events", events);
            return modelAndView;
        }
       
        else {
        	
        	
        	
        	
      	  if (a != null) {
                httpSession.setAttribute("BRANCH_RECEPTION", a);
            List<Instrument> instruments = adminService.getAllInstruments();
            ModelAndView modelAndView = new ModelAndView("branchReception/branchReceptionIndex");
            modelAndView.addObject("instruments", instruments);
            List<Event> events = adminService.getAllEvents();
            modelAndView.addObject("events", events);
            return modelAndView;
                
              
            }
      	  else
      	  {
            return new ModelAndView("admin/adminLogin", "msg", msg);
      	  }
        }
    }

    @RequestMapping(value = "addAdmin", method = RequestMethod.GET)
    public ModelAndView addAdmin(@ModelAttribute Admin admin) {
        List<Admin> adminList = adminService.getAllAdmins();
        ModelAndView modelAndView = new ModelAndView("admin/adminRegistrationForm");
        modelAndView.addObject("adminList", adminList);
        return modelAndView;

    }

    @RequestMapping("allUsers")
    public ModelAndView getAllUsers() {

        List<User> userList = userService.getAllActiveUsers();
        Admin branch_admin = (Admin) httpSession.getAttribute("BRANCH_ADMIN");
        logger.info("admin " + branch_admin.getAdminName());
        if (branch_admin.getAdminOfBranch() != null) {
            userList = userService.getAllActiveUsersByBranch(branch_admin.getAdminOfBranch());
        }

        ModelAndView modelAndView = new ModelAndView("admin/allUsers");

        if (branch_admin.getAdminOfBranch() == null) {
            modelAndView.addObject("headerFile", "../comman_files/adminHeaderFile.jsp");
        } else {
            modelAndView.addObject("headerFile", "../comman_files/branchAdminHeaderFiles.jsp");
        }

        modelAndView.addObject("userList", userList);
        return modelAndView;
    }

    @RequestMapping("feeDueStudents")
    public ModelAndView getAllFeeDueStudents() {

        List<User> userList = userService.getAllFeeDueStudents();
        Admin branch_admin = (Admin) httpSession.getAttribute("BRANCH_ADMIN");
        logger.info("admin " + branch_admin.getAdminName());
        if (branch_admin.getAdminOfBranch() != null) {
            userList = userService.getAllFeeDueStudentsByBranch(branch_admin.getAdminOfBranch());
        }

        ModelAndView modelAndView = new ModelAndView("admin/feeDueStudents");

        if (branch_admin.getAdminOfBranch() == null) {
            modelAndView.addObject("headerFile", "../comman_files/adminHeaderFile.jsp");
        } else {
            modelAndView.addObject("headerFile", "../comman_files/branchAdminHeaderFiles.jsp");
        }

        modelAndView.addObject("userList", userList);
        return modelAndView;
    }
   
    @RequestMapping("viewUsername")
    public ModelAndView viewUsername(@ModelAttribute Admin admin) {
        logger.info("Creating Branch Form ");
        List<Admin> admins = adminService.getAllAdmins();
        ModelAndView modelAndView = new ModelAndView("admin/addBranch");
        modelAndView.addObject("admin", admin);
        modelAndView.addObject("admins", admins);
        return modelAndView;
    } 
    
    
    
    @RequestMapping("addBranch")
    public ModelAndView addBranch(@ModelAttribute Branch branch) {
        logger.info("Creating Branch Form ");
        List<Branch> branches = adminService.getAllBranch();
        ModelAndView modelAndView = new ModelAndView("admin/addBranch");
        modelAndView.addObject("branch", branch);
        modelAndView.addObject("branches", branches);
        return modelAndView;
    }

    @RequestMapping(value = "saveBranch", method = RequestMethod.POST)
    public ModelAndView saveBranch(@ModelAttribute Branch branch) {
        logger.info("Saving Branch: " + branch.getBranchName());
        String adminPassword=dynamicGenerator.passwordGenerator();
         String receptionPassword=dynamicGenerator.passwordGenerator();
        branch.getAdmin().setAdminPassword(adminPassword);
        branch.getAdmin().setReceptionPassword(receptionPassword);
        branch.getAdmin().setAdminOfBranch(branch);
        adminService.addBranch(branch);
        List<Branch> branches = adminService.getAllBranch();
        String Branchname = branch.getBranchName();
        String BranchAddress = branch.getBranchAddress();
         String AdminEmail = branch.getAdmin().getAdminEmail();
          String AdminMobile = branch.getAdmin().getAdminMobileNo();
          
        
         String Emailmsg ="WELCOME" +"\n\n"+"Our new Branch at " +BranchAddress+"Starting Succefully"
                 +"\n\n"+"Feel your site at http://angelmusic.com"
                 +"\n\n"+"NOTE:PLEASE READ EVERYTHING BELOW.\n" 
                 +"The below are Login Details of Branch Admin and Branch Reception"+"\n\n"
                 +"Login Details for Branch Admin of  "+Branchname+"\n"
                 +"Admin Email:-"+AdminEmail+"\n"
                 +"Password:-"+adminPassword+"\n\n\n"
                 +"Login Details for Branch Reception of  "+Branchname+"\n"
                 +"Reception Email:-"+AdminEmail+"\n"
                 +"Password:-"+receptionPassword+"\n\n\n";
         String subject ="Login Credentials";
          SendMail.mailsend(AdminEmail, Emailmsg, subject);
          SendMessage.sendMobileMSG(AdminMobile ,Emailmsg);

        ModelAndView modelAndView = new ModelAndView("admin/addBranch");
        modelAndView.addObject("branch", branch);
        modelAndView.addObject("branches", branches);
        return modelAndView;
    }

    @RequestMapping("addSubject")
    public ModelAndView addSubject(@ModelAttribute Subject subject) {
        logger.info("Creating Subject Form ");
        List<Subject> subjects = adminService.getAllSubjects();
        ModelAndView modelAndView = new ModelAndView("admin/addSubject");
        modelAndView.addObject("subject", subject);
        modelAndView.addObject("subjects", subjects);
        return modelAndView;
    }

    @RequestMapping(value = "saveBatchTiming", method = RequestMethod.POST)
    public ModelAndView saveBatchTiming(@ModelAttribute BatchTime BT) {
        logger.info("Saving BatchTime: " + BT.getBatchTiming());
        adminService.addBatchTiming(BT);
        List<BatchTime> bts = adminService.getAllBatchTiming();
        ModelAndView modelAndView = new ModelAndView("admin/addBatchTiming");
        modelAndView.addObject("BT", BT);
        modelAndView.addObject("BTS", bts);
        return modelAndView;
    }

    @RequestMapping("addBatchTiming")
    public ModelAndView addBatchTiming(@ModelAttribute BatchTime BT) {
        logger.info("Creating BatchTiming Form ");
        List<BatchTime> bts = adminService.getAllBatchTiming();
        ModelAndView modelAndView = new ModelAndView("admin/addBatchTiming");
        modelAndView.addObject("BT", BT);
        modelAndView.addObject("BTS", bts);
        return modelAndView;
    }

    @RequestMapping(value = "saveSubject", method = RequestMethod.POST)
    public ModelAndView saveSubject(@ModelAttribute Subject subject) {
        logger.info("Saving Subject: " + subject);
        adminService.createSubject(subject);
        List<Subject> subjects = adminService.getAllSubjects();
        ModelAndView modelAndView = new ModelAndView("admin/addSubject", "subjects", subjects);
        return modelAndView;
    }
    
     @RequestMapping("addCourse")
    public ModelAndView addCourse(@ModelAttribute Course course) {
        logger.info("Creating Subject Form ");
        List<Subject> subjects = adminService.getAllSubjects();
        ModelAndView modelAndView = new ModelAndView("admin/addCourse");
        modelAndView.addObject("course", course);
        modelAndView.addObject("subjects", subjects);
        return modelAndView;
    }
    
    
    
  @RequestMapping(value = "saveCourse", method = RequestMethod.POST)
    public ModelAndView saveCourse(@ModelAttribute Course course) {
        logger.info("Saving Subject: " + course);
        Subject subject=course.getSubject();
        long id=subject.getSubjectId();
        Subject sub=adminService.getSubject(id);
        adminService.createCourse(course);
        adminService.updateSubject(sub);
         List<Subject> subjects = adminService.getAllSubjects();
        ModelAndView modelAndView = new ModelAndView("admin/addCourse");
        modelAndView.addObject("course", course);
        modelAndView.addObject("subjects", subjects);
        return modelAndView;
    }
    @RequestMapping("searchUserByAdmin")
    public ModelAndView searchUser(@RequestParam("searchName") String searchName) {
        logger.info("Searching the User. User Names: " + searchName);
        List<User> userList = userService.getAllUsers(searchName);
        return new ModelAndView("userList", "userList", userList);
    }

    @RequestMapping("addInstrument")
    public ModelAndView addInstrument(@ModelAttribute Instrument instrument, HttpServletRequest request) {
        logger.info("Creating Instrument Form ");
        String rootPath = request.getSession().getServletContext().getRealPath("/");
        logger.info("rootPath " + rootPath);
        List<Instrument> instruments = adminService.getAllInstruments();
        ModelAndView modelAndView = new ModelAndView("admin/addInstrument");
        modelAndView.addObject("instrument", instrument);
        modelAndView.addObject("instruments", instruments);
        return modelAndView;
    }

    @RequestMapping(value = "saveInstrument", method = RequestMethod.POST)
    public ModelAndView saveInstrument(@ModelAttribute Instrument instrument, @RequestParam("instrumentImage") MultipartFile file, HttpServletRequest request) throws IOException {
        if (!file.isEmpty()) {

            try {
                String rootPath = request.getSession().getServletContext().getRealPath("/");
                File dir = new File(rootPath + File.separator + "instruments");
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                File destination = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());
                logger.info("File Path is : " + destination.getPath());

                BufferedImage originalImage = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
                int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();

                BufferedImage resizeImageJpg = resizeImage(originalImage, type, 257, 257);
                ImageIO.write(resizeImageJpg, "png", destination);

                instrument.setInstrumentImgName(file.getOriginalFilename());
            } catch (Exception exception) {
                exception.printStackTrace();
            }

        }
        logger.info("Saving instrument : " + instrument.getInstrumentName());

        adminService.addInstrument(instrument);
        List<Instrument> instruments = adminService.getAllInstruments();
        ModelAndView modelAndView = new ModelAndView("admin/addInstrument");
        modelAndView.addObject("instrument", instrument);
        modelAndView.addObject("instruments", instruments);

        return modelAndView;

    }

    @RequestMapping("addGallery")
    public ModelAndView getGallery(@ModelAttribute PhotosVideos photosVideo) {
        logger.info("Creating Gallery Form ");
        List<PhotosVideos> photosVideos = adminService.getAllphotosVideos();
        ModelAndView modelAndView = new ModelAndView("admin/addPhotoVideo");
        modelAndView.addObject("photosVideo", photosVideo);
        modelAndView.addObject("photosVideos", photosVideos);
        return modelAndView;
    }

    @RequestMapping(value = "saveGallery", method = RequestMethod.POST)
    public ModelAndView saveInstrument(@ModelAttribute PhotosVideos photosVideo, @RequestParam("photoVideo") MultipartFile file, HttpServletRequest request) throws IOException {
        if (!file.isEmpty()) {

            try {
                String rootPath = request.getSession().getServletContext().getRealPath("/");
                File dir = new File(rootPath + File.separator + "gallery");
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename())));
                stream.write(bytes);
                stream.close();
                photosVideo.setFileName(file.getOriginalFilename());
                photosVideo.setType(file.getContentType());
            } catch (Exception exception) {
                exception.printStackTrace();
            }

        }
        logger.info("Saving Gallery : " + photosVideo.getName());

        adminService.addPhotoVideo(photosVideo);
        List<PhotosVideos> photosVideos = adminService.getAllphotosVideos();
        ModelAndView modelAndView = new ModelAndView("admin/addPhotoVideo");
        modelAndView.addObject("photosVideo", photosVideo);
        modelAndView.addObject("photosVideos", photosVideos);
        return modelAndView;

    }

    @RequestMapping("addEvent")
    public ModelAndView addEvent(@ModelAttribute Event event) {
        logger.info("Creating Event Form " + event.getEventName());
        List<Event> events = adminService.getAllEvents();
        ModelAndView modelAndView = new ModelAndView("admin/addEvent");
        modelAndView.addObject("events", events);
        return modelAndView;
    }

    @RequestMapping(value = "saveEvent", method = RequestMethod.POST)
    public ModelAndView Event(@ModelAttribute Event event, @RequestParam("eventImg") MultipartFile file, HttpServletRequest request) throws IOException {
        if (!file.isEmpty()) {

            try {
                String rootPath = request.getSession().getServletContext().getRealPath("/");
                File dir = new File(rootPath + File.separator + "gallery");
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                File destination = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());
                logger.info("Uploaded Photo Path is : " + destination.getPath());
                BufferedImage originalImage = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
                int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();

                BufferedImage resizeImagePng = resizeImage(originalImage, type, 1280, 600);
                ImageIO.write(resizeImagePng, "png", destination);
                event.setEventImgName(file.getOriginalFilename());

            } catch (Exception exception) {
                exception.printStackTrace();
            }

        }
        logger.info("Saving Event : " + event.getEventName());

        adminService.addEvent(event);
        List<Event> events = adminService.getAllEvents();
        ModelAndView modelAndView = new ModelAndView("redirect:addEvent");
        modelAndView.addObject("events", events);
        return modelAndView;

    }

    @RequestMapping(value = "getAllEventApplicationList", method = RequestMethod.GET)
    public ModelAndView getAllEventApplicationList() {

        List<EventApplication> applicantList = userService.getAllEventApplications();
        ModelAndView modelAndView = new ModelAndView("admin/getEventApplications");
        modelAndView.addObject("applicantList", applicantList);
        return modelAndView;

    }

    @RequestMapping(value = "newAdmissions", method = RequestMethod.GET)
    public ModelAndView getnewAdmissions() {
        List<User> userList = userService.getAllWatingUsers();
        Admin branch_admin = (Admin) httpSession.getAttribute("BRANCH_ADMIN");
        if (branch_admin.getAdminOfBranch() != null) {
            userList = userService.getAllWatingUsersByBranch(branch_admin.getAdminOfBranch());
        }
        ModelAndView modelAndView = new ModelAndView("admin/newAdmissions");
        modelAndView.addObject("userList", userList);
        if (branch_admin.getAdminOfBranch() == null) {
            modelAndView.addObject("headerFile", "../comman_files/adminHeaderFile.jsp");
        } else {
            modelAndView.addObject("headerFile", "../comman_files/branchAdminHeaderFiles.jsp");
        }

        return modelAndView;

    }

    @RequestMapping(value = "newAdmissionApprovel/{userID}", method = RequestMethod.GET)
    public ModelAndView getAdmissionDetails(@PathVariable("userID") long userID) {
        Admin branch_admin = (Admin) httpSession.getAttribute("BRANCH_ADMIN");
        User user = userService.getUser(userID);
        ModelAndView modelAndView = new ModelAndView("admin/newAdmissionApprovel");
        if (branch_admin.getAdminOfBranch() == null) {
            modelAndView.addObject("headerFile", "../comman_files/adminHeaderFile.jsp");
        } else {
            modelAndView.addObject("headerFile", "../comman_files/branchAdminHeaderFiles.jsp");
        }

        String newJrNo = dynamicGenerator.jrNoGenerator();
        user.setJrno(newJrNo);
        modelAndView.addObject("user", user);

        return modelAndView;
    }

    @RequestMapping(value = "addExam", method = RequestMethod.GET)
    public ModelAndView getExamForm(@ModelAttribute Exam exam) {
        List<Exam> exams = adminService.getAllExams();
        ModelAndView modelAndView = new ModelAndView("admin/addExam");
        modelAndView.addObject("exams", exams);
        return modelAndView;
    }

    @RequestMapping(value = "saveExam", method = RequestMethod.POST)
    public ModelAndView saveExam(@ModelAttribute Exam exam) {
        logger.info("Saving Exam: " + exam.getExamName());
        adminService.addExam(exam);
        List<Exam> exams = adminService.getAllExams();
        ModelAndView modelAndView = new ModelAndView("admin/addExam");
        modelAndView.addObject("exams", exams);
        return modelAndView;
    }

    @RequestMapping(value = "confirmAdmission", method = RequestMethod.POST)
    public ModelAndView confirmAdmission(
            @ModelAttribute User user,
            @RequestParam(value = "d1", required = false) String d1,
            @RequestParam(value = "d2", required = false) String d2
    ) throws ParseException {
        if (user.getSecondInstallment() > 0) {
            user.setSecondInstallmentDate(new SimpleDateFormat("dd/MM/yyyy").parse(d1));
        }
        if (user.getLastInstallment() > 0) {
            user.setLastInstallmentDate(new SimpleDateFormat("dd/MM/yyyy").parse(d2));
        }

        user.setFirstInstallmentDate(new Date());

        User oldUser = userService.getUser(user.getUserId());
        oldUser.setJrno(user.getJrno());
        oldUser.setBalance(user.getBalance());
        oldUser.setFirstInstallment(user.getFirstInstallment());
        oldUser.setFirstInstallmentDate(new Date());
        oldUser.setLastInstallment(user.getLastInstallment());
        oldUser.setLastInstallmentDate(user.getLastInstallmentDate());
        oldUser.setSecondInstallment(user.getSecondInstallment());
        oldUser.setSecondInstallmentDate(user.getSecondInstallmentDate());
        oldUser.setTotalFees(user.getTotalFees());
        oldUser.setUserRegisteredDate(new Date());
        oldUser.setStatus(Cons.STUDENT_STATUS_ACTIVE);
        logger.info("User ID: " + oldUser.getUserId());

        userService.updateUser(oldUser);

        List<User> userList = userService.getAllWatingUsers();
        Admin branch_admin = (Admin) httpSession.getAttribute("BRANCH_ADMIN");
        if (branch_admin.getAdminOfBranch() != null) {
            userList = userService.getAllWatingUsersByBranch(branch_admin.getAdminOfBranch());
        }
        ModelAndView modelAndView = new ModelAndView("admin/newAdmissions");
        modelAndView.addObject("userList", userList);
        if (branch_admin.getAdminOfBranch() == null) {
            modelAndView.addObject("headerFile", "../comman_files/adminHeaderFile.jsp");
        } else {
            modelAndView.addObject("headerFile", "../comman_files/branchAdminHeaderFiles.jsp");
        }
        //send sms and mail
        userService.sendAdmissionConfirmSMS(oldUser);
        userService.sendAdmissionConfirmMail(oldUser);

        modelAndView.addObject("jrno", oldUser.getUserId());
        return modelAndView;
    }

    @RequestMapping(value = "admissionPrint/{jrno}", method = RequestMethod.GET)
    public ModelAndView getAdmissionPrint(@ModelAttribute User value, @PathVariable("jrno") long jrno) {
        Admin branch_admin = (Admin) httpSession.getAttribute("BRANCH_ADMIN");
        User user = userService.getUser(jrno);
        if (branch_admin == null) {
            return new ModelAndView("admin/adminLogin");
        }

        ModelAndView modelAndView = new ModelAndView("admin/admissionPrint");
        modelAndView.addObject("user", user);
        return modelAndView;
    }

    @RequestMapping(value = "getAllExamApplicationList", method = RequestMethod.GET)
    public ModelAndView getAllExamApplicationList(@ModelAttribute ExamApplication examApplication) {
        List<ExamApplication> examApplications = userService.getAllExamApplications();
        ModelAndView modelAndView = new ModelAndView("admin/getAllExamApplicationList");
        Admin branch_admin = (Admin) httpSession.getAttribute("BRANCH_ADMIN");
        if (branch_admin.getAdminOfBranch() == null) {
            modelAndView.addObject("headerFile", "../comman_files/adminHeaderFile.jsp");
        } else {
            modelAndView.addObject("headerFile", "../comman_files/branchAdminHeaderFiles.jsp");
        }

        modelAndView.addObject("examApplications", examApplications);
        return modelAndView;
    }

    @RequestMapping("inquiry")
    public ModelAndView getUserRegistration(@ModelAttribute User user) {
        logger.info("Getting Inquiry page");
        ModelAndView modelAndView = new ModelAndView("branchReception/inquiry");
        modelAndView.addObject("branchs", adminService.getAllBranch());
        modelAndView.addObject("days", initDaysList());
        modelAndView.addObject("subjects", adminService.getAllSubjects());
        modelAndView.addObject("time", adminService.getAllBatchTiming());
        return modelAndView;
    }

    private List<String> initDaysList() {
        List<String> daysList = new ArrayList<String>();
        daysList.addAll(Arrays.asList(new DateFormatSymbols().getWeekdays()));
        daysList.remove("Sunday");
        daysList.remove(0);
        return daysList;
    }

    /**************************** Add Instrument Subcategory *********************************/
    
    @RequestMapping("addInstrumentSubcategory")
    public ModelAndView addInstrumentSubcategory(@ModelAttribute InstrumentSubcategory instrumentSubcategory) {
        logger.info("Creating InstrumentSubcategory Form ");
        List<Instrument> instruments = adminService.getAllInstruments();
        ModelAndView modelAndView = new ModelAndView("admin/addInstrumentSubcategory");
        modelAndView.addObject("instruments", instruments);
        modelAndView.addObject("instrumentSubcategory", instrumentSubcategory);
        return modelAndView;
    }
    
    
    @RequestMapping(value = "saveInstrumentSubcategory", method = RequestMethod.POST)
    public ModelAndView saveInstrumentSubcategory(@ModelAttribute InstrumentSubcategory instrumentSubcategory) {
//        logger.info("Saving Exam: " + exam.getExamName());
    	Instrument instrument=instrumentSubcategory.getInstrument();
    	   logger.info("Saving Exam: " + instrument);
         int id=instrument.getInstrumentId();
         logger.info("Saving Exam: " + id);
         Instrument inst=adminService.getInstrument(id);
         logger.info("Saving Exam: " + inst);
         
         
        adminService.addInstrumentSubcategory(instrumentSubcategory);
        adminService.updateInstrument(inst);
      
        ModelAndView modelAndView = new ModelAndView("admin/addInstrumentSubcategory");
        List<Instrument> instruments = adminService.getAllInstruments();
        modelAndView.addObject("instruments", instruments);
        modelAndView.addObject("instrumentSubcategory", instrumentSubcategory);
        return modelAndView;
    }
    
    /**************************** End of Instrument Subcategory *********************************/
   
    /**************************** Add Product *********************************/
    @RequestMapping("addProduct")
    public ModelAndView addProduct(@ModelAttribute Product product) {
        logger.info("Creating Product Form ");
        List<Product> products = adminService.getAllProducts();
        ModelAndView modelAndView = new ModelAndView("admin/addProducts");
        List<Instrument> instruments = adminService.getAllInstruments();
        modelAndView.addObject("instruments", instruments);
        List<InstrumentSubcategory> instrumentSubcategory = adminService.getAllInstrumentSubcategorys();
        modelAndView.addObject("instrumentSubcategory", instrumentSubcategory);
        modelAndView.addObject("products", products);
        return modelAndView;
    }
    
    @RequestMapping(value = "saveProduct", method = RequestMethod.POST)
    public ModelAndView saveProduct(@ModelAttribute Product product) {
    	 logger.info("In add product");   
//    	Product prod=product.getProductName();
    	Instrument instrument=product.getInstrumentName();
    	InstrumentSubcategory instrumentSubcategory1=product.getInstrumentSubcategory();
	   logger.info("Saving Exam: " + instrument);
     int id=instrument.getInstrumentId();
     long idd=instrumentSubcategory1.getInstrumentSubcategoryId();
     
      logger.info("Saving Exam: " + id);
      Instrument inst=adminService.getInstrument(id);
      InstrumentSubcategory instsub=adminService.getInstrumentSubcategory(idd);
      logger.info("Saving Exam: " + inst);
      	//logger.info("Saving Product: " + product.getProductName());
        adminService.addProduct(product);
        adminService.updateInstrument(inst);
        adminService.updateInstrumentSubcategory(instsub);
        
        List<Product> products = adminService.getAllProducts();
        ModelAndView modelAndView = new ModelAndView("admin/addProducts");
        modelAndView.addObject("products", products);
        List<Instrument> instruments = adminService.getAllInstruments();
        modelAndView.addObject("instruments", instruments);
        List<InstrumentSubcategory> instrumentSubcategory = adminService.getAllInstrumentSubcategorys();
        modelAndView.addObject("instrumentSubcategory", instrumentSubcategory);
        return modelAndView;
    }
    
    /**************************** End Add Product *********************************/
   
    
    /**************************** Purchase order *********************************/
    /**************************** End Purchase order *********************************/
    
    @RequestMapping("addPurchaseOrder")
    public ModelAndView addPurchaseOrder(@ModelAttribute Purchase purchase) {
        logger.info("Creating Product Form ");
        List<Product> products = adminService.getAllProducts();
        ModelAndView modelAndView = new ModelAndView("admin/addPurchaseOrder");
        List<Instrument> instruments = adminService.getAllInstruments();
        modelAndView.addObject("instruments", instruments);
        List<InstrumentSubcategory> instrumentSubcategory = adminService.getAllInstrumentSubcategorys();
        modelAndView.addObject("instrumentSubcategory", instrumentSubcategory);
        modelAndView.addObject("productlist", products);
        return modelAndView;
    }
    
    @RequestMapping(value = "savePurchase", method = RequestMethod.POST)
    public ModelAndView savePurchase(@ModelAttribute Purchase purchase) {
    	 logger.info("In add product");  
    	 Product prd=purchase.getProductId();
    	   int id=prd.getProductId();
    	   int quantity1=purchase.getQuentity();
    	  Product productt=adminService.getProduct(id);
    	  productt.setSellPrice(purchase.getSellPrice());
    	  productt.setUnitPrice(purchase.getUnitPrice());
    	  int quantity2=productt.getQuentity();
    	  int quant=(int)quantity1+(int)quantity2;
    	  productt.setQuentity(quant);
    	  productt.setTransportCharge(purchase.getTransportCharge());
        adminService.addPurchase(purchase);
        adminService.updateProduct(productt);
       
        List<Product> products = adminService.getAllProducts();
        ModelAndView modelAndView = new ModelAndView("admin/addPurchaseOrder");
        List<Instrument> instruments = adminService.getAllInstruments();
        modelAndView.addObject("instruments", instruments);
        List<InstrumentSubcategory> instrumentSubcategory = adminService.getAllInstrumentSubcategorys();
        modelAndView.addObject("instrumentSubcategory", instrumentSubcategory);
        modelAndView.addObject("productlist", products);
        return modelAndView;
    }
}
