package com.study.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.dto.ApprovalDTO;
import com.study.dto.ApprovalFileDTO;
import com.study.dto.AttDTO;
import com.study.dto.CommuteDTO;
import com.study.dto.CriteriaDTO;
import com.study.dto.PageDTO;
import com.study.service.ApprovalService;
import com.study.service.CommuteService;
import com.study.service.DispatchService;
import com.study.service.HrService;
import com.study.service.MemoService;
import com.study.service.MsgService;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Slf4j
@RequestMapping("/user/*")
public class UserController {
	
	// 1. 사용자 - 결재 서비스
	@Autowired
	private ApprovalService approvalService;
	
	// 2. 사용자 - 업무지원 - 파견 - 전체 직원 근태리스트
	@Autowired
	private DispatchService dispatchService;
	
	
	// 3. 사용자 - 업무지원 - 파견(+인사) - 한 직원 근태리스트
	@Autowired
	private CommuteService commuteService;
	
	
	// 4. 사용자 - 업무지원 - 인사 - 전체 직원 근태리스트
	@Autowired
	private HrService hrService;
	
	
	
	
	
	
	
	
	
	
	
	
	// 결재 부분부터
	//사용자 - 결재 추가
	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/approvalInsert")
	public String userApprovalInsert() {
		log.info("사용자가 결재 기안하기");
		return "/user/approval/approval_insert";
	}
	
	// 사용자 - 결재 추가 POST 부분
	//@PreAuthorize("isAuthenticated()")
	@PostMapping("/approvalInsert")
	public String registerPost(ApprovalDTO insertDto, MultipartFile[] uploadFile) {
	      log.info("기안폼등록"+insertDto);
	      
	      
	      List<ApprovalFileDTO> attachList = new ArrayList<ApprovalFileDTO>();
	      
	      // 업로드 기본 폴더 지정
	      String uploadBasicPath = "d:\\upload";
	      
	      // 업로드 세부 폴더 지정 / 날짜 기준으로 나눠주는 
	      String uploadFolderPath = getFolder();
	      
	      // 전체 업로드 패스 생성 / 파일 객체 생성 / "d:\\upload\\2022\06\08"
	      File uploadPath = new File(uploadBasicPath,uploadFolderPath);
	      
	      if(!uploadPath.exists()) { // 폴더가 없다면 폴더들 생성
	         uploadPath.mkdirs();
	      }
	      
	      String uploadFileName = "";
	      File save = null;
	      
	      for(MultipartFile f : uploadFile) {
	         log.info("파일명 : " + f.getOriginalFilename());
	         log.info("파일크기 : " + f.getSize());
	         
	         // 파일명 가져오기
	         String oriFileName = f.getOriginalFilename();
	         
	         //중복 파일명 해결하기
	         UUID uuid = UUID.randomUUID();
	         uploadFileName = uuid.toString()+"_"+oriFileName;
	         
	         //업로드 파일 객체 생성
	         ApprovalFileDTO fileDto = new ApprovalFileDTO();
	         fileDto.setApproval_file_dir(uploadFolderPath);
	         fileDto.setApproval_file_name(oriFileName);
	         fileDto.setApproval_file_id(uuid.toString());
	         
	
	         save = new File(uploadPath, uploadFileName);
	         try {      
	            if(checkImageType(save)) {
	               fileDto.setApproval_file_type(true);
	               
	               
	            //썸네일 저장
	            FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
	            InputStream in = f.getInputStream();
	            Thumbnailator.createThumbnail(in, thumbnail, 80, 80);
	            in.close();
	            thumbnail.close();
	            }
	            // 파일저장
	            f.transferTo(save);
	            
	            attachList.add(fileDto);
	            
	            
	         } catch (IllegalStateException e) {
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
      }
      
      
      //첨부파일 정보 추가하기
      insertDto.setAttachList(attachList);
      
      
      approvalService.insert(insertDto);
      return "redirect:/user/approvalList";
	}
  	 // 결재 기안 끝
	
	
	// 썸네일 부분 - 메소드 사용
	// 썸네일 이미지 보여주기
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName) {
      log.info("이미지 요청" + fileName);
      
      File file = new File("d:\\upload\\"+fileName);
      
      ResponseEntity<byte[]> image = null;
      
      HttpHeaders header = new HttpHeaders();
      try {
         header.add("Content-Type", Files.probeContentType(file.toPath()));
         image = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
      
      } catch (IOException e) {
         e.printStackTrace();
      }
      return image;
   } // 썸네일 끝
   
   
    // 다운로드 부분
    // 다운로드
  	@GetMapping(path = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
  	public ResponseEntity<Resource> downloadFile(String fileName){
	     log.info("다운로드 요청 " + fileName);
	     
	     Resource resource = new FileSystemResource("d:\\upload\\" + fileName);
	     String resourceUidName = resource.getFilename();
	     //uuid 값 제거
	     String resourceName = resourceUidName.substring(resourceUidName.indexOf("_")+1);
	     
	     //Spring 객체 >> headers 추가 
	     HttpHeaders headers = new HttpHeaders();
	     
	     try {
	        headers.add("Content-Disposition", "attachment;filename=" + new String(resourceName.getBytes("utf-8"), "ISO-8859-1"));
	     } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	     }
	     
	     return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	} // 다운로드 끝
  	
  	
  	// 이미지 파일 확인
    private boolean checkImageType(File file) {
        try {
           String contentType = Files.probeContentType(file.toPath());
           return contentType.startsWith("image"); // image/jepg, image/gif, image/bmp, image/png
        } catch (IOException e) {
           e.printStackTrace();
        }
        return false;
     } // 이미지 끝
    
    
    // 폴더 생성 메소드
    private String getFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
        // 오늘 날짜
        Date date = new Date();
        
        String str = sdf.format(date); // 2022-06-08
        
        // windows: \, unix: /
        return str.replace("-", File.separator); // 2022\06\08 = getFolder
     } // 폴더 생성 끝
    
    
    
    
    
    // 결재 리스트 부분
  	@GetMapping("/approvalList")
    public String listGet(Model model, @ModelAttribute("cri") CriteriaDTO cri) {
        log.info("전체리스트현황"+cri);
        
        List<ApprovalDTO> list = approvalService.select(cri);
        
        int total = approvalService.totalCnt(cri);

        model.addAttribute("pageDto", new PageDTO(cri, total));
        model.addAttribute("list", list);
        
        return "/user/approval/approval_list";
     } // 결재 리스트 끝
  	
  	
  	// 첨부 파일 부분
  	@GetMapping("/getAttachList")
    public ResponseEntity<List<ApprovalFileDTO>> getAttachList(String approval_id) {
       log.info("첨부파일 "+approval_id);
          
       approvalService.attachList(approval_id);
          
       return new ResponseEntity<List<ApprovalFileDTO>>(approvalService.attachList(approval_id) ,HttpStatus.OK);
    } // 첨부파일 끝
  	
  	
  	// 결재 하나 불러오기 - READ
    @GetMapping("/approvalRead")
    public String readGet(Model model, String approval_id, @ModelAttribute("cri") CriteriaDTO cri) {
       log.info("게시물 요청"+approval_id);
       
       ApprovalDTO dto =  approvalService.read(approval_id);
       model.addAttribute("dto",dto);
       
       return "/user/approval/approval_read";
    }
  	///////////////////////////////////////////////////// 결재 부분 끝 //////////////////////////////////////////////////////////////////////////////////////
  	
    
    
    
    
    
    
    
	///////////////////////////////////////////////////// 업무지원 시작 ////////////////////////////////////////////////////////////////////////////////////////
	
    // 파견 - 전체 직원 근태리스트
    @GetMapping("/support/dispatch/att")
    public void dispatchList(Model model,@ModelAttribute("cri") CriteriaDTO cri) {
       log.info("파견직원리스트 요청");
       
       List<AttDTO> hrlist = dispatchService.hrList(cri);
       
       int total = dispatchService.totalCnt(cri);
       
       model.addAttribute("pageDto", new PageDTO(cri, total));
       model.addAttribute("hrlist", hrlist);
    }
    
    @PostMapping("/supprot/dispatch/att")
    public String dispatchListPost(@RequestParam("att_id") String att_id, Model model, RedirectAttributes rttr) {
    
       log.info("근태리스트 요청");
       
       rttr.addAttribute("att_id",att_id);
       model.addAttribute("att_id",att_id);
       
       return "redirect:/user/support/dispatch/attlist";
    }
    
    // 파견 - 직원 한 명 근태리스트
    @GetMapping("/support/dispatch/attlist")
    public void dispatchAttList(@RequestParam("att_id") String att_id, Model model) {
       
       log.info("근태리스트 요청"+att_id);
       
       List<CommuteDTO> comlist = commuteService.readCommute(att_id);
       model.addAttribute("comlist",comlist);
    }   

 
    
    // 인사 - 직원 리스트
    @GetMapping("/support/hr/att")
    public void hrList(Model model,@ModelAttribute("cri")CriteriaDTO cri) {
       log.info("인사직원리스트 요청");
       
       List<AttDTO> hrlist = hrService.hrList(cri);
       int total = hrService.totalCnt(cri);
       
       model.addAttribute("pageDto", new PageDTO(cri, total));
       
       model.addAttribute("hrlist", hrlist);
    }
    
    @PostMapping("/support/hr/att")
    public String hrListPost(@RequestParam("att_id") String att_id, Model model, RedirectAttributes rttr) {
       log.info("aaaa");
       
       rttr.addAttribute("att_id",att_id);
       model.addAttribute("att_id",att_id);
       
       return "redirect:/user/support/hr/attlist";
       
    }

    @GetMapping("/support/hr/attlist")
    public void attList(@RequestParam("att_id") String att_id,Model model) {
       log.info("근태리스트 요청"+att_id);
       
       List<CommuteDTO> comlist= commuteService.readCommute(att_id);
       model.addAttribute("comlist", comlist);
    }
///////////////////////////////////////////////////// 업무지원 끝 /////////////////////////////////////////////////////////////////////////////////////
	
	
	
    
 //////////////////////////////////////////////////////////////////메인페이지 시작//////////////////////////////////////////////////////////////////////
    
    // 메인 페이지는 SecurityController 에서 처리
    
    
    
    
    
    
    
    
    
    
    
	
}
