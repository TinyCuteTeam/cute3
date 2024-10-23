package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mandoo.Service.BOMService;
import kr.co.mandoo.dto.BOMDTO;

@Controller
public class BOMController {

    @Autowired
    BOMService bomService;
	
    @RequestMapping("/bom")
    public String listBOM(Model model, 
                          @RequestParam(required = false) String bom_Id,
                          @RequestParam(defaultValue = "1") int page,  // 페이지 번호 (기본값 1)
                          @RequestParam(defaultValue = "8") int pageSize) {  // 페이지당 항목 수 (기본값 8)
        List<BOMDTO> bomList;
        List<String> bomIds;

        // bom_Id가 선택된 경우 해당 BOM 목록을 가져옴
        if (bom_Id != null && !bom_Id.isEmpty()) {
            bomList = bomService.selectBOMById(bom_Id); // 특정 bom_Id에 대한 리스트를 가져옴
        } else {
            bomList = bomService.listBOM(); // 모든 BOM 목록 가져오기
        }

        // 전체 항목 수와 페이지 수 계산
        int totalItems = bomList.size();
        int totalPages = (totalItems + pageSize - 1) / pageSize;  // 전체 페이지 수 계산

        // 현재 페이지에 해당하는 데이터만 잘라서 서브리스트로 전송
        int startIndex = (page - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalItems);
        List<BOMDTO> paginatedList = bomList.subList(startIndex, endIndex);

        // 모델에 데이터를 추가
        model.addAttribute("list", paginatedList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("bom_Id", bom_Id);
        model.addAttribute("bomIds", bomService.selectGroupbyBOMId()); // BOM ID 목록 추가

        return "BOM";
    }
	
    @RequestMapping(value="/bomDelete", method=RequestMethod.POST)
	public String deleteBOM(Model model, BOMDTO bomDTO) {
		
		int result = bomService.deleteBOM(bomDTO);
		System.out.println("bom delete 실행: "+result);
		
		return "redirect:/bom";
	}
	
	@RequestMapping(value="/bomInsert", method=RequestMethod.POST)
	public String insertBOM(Model model, BOMDTO bomDTO) {
		
		int result = bomService.insertBOM(bomDTO);
		System.out.println("bom insert 실행: " + result);
		
		return "redirect:/bom";
	}
	
	@RequestMapping(value="/bomUpdate", method=RequestMethod.POST)
	public String updateBOM(Model model, BOMDTO bomDTO) {
		
		int result = bomService.updateBOM(bomDTO);
		System.out.println("bom update 실행: " + result);
		System.out.println("BOM DTO: "+ bomDTO);
		String bomId=bomDTO.getBom_Id();
		
		System.out.println("bomId: "+bomId);
		
		return "redirect:/bom";
	}
	
//  @RequestMapping("/bom")
//  public String listBOM(Model model, 
//                        @RequestParam(required = false) String bom_Id,
//                        @RequestParam(defaultValue = "1") int page,  // 페이지 번호 (기본값 1)
//                        @RequestParam(defaultValue = "8") int pageSize) {  // 페이지 당 항목 수 (기본값 5)
//      List<BOMDTO> bomList;
//
//      // bom_Id가 선택된 경우 해당 BOM 목록을 가져옴
//      if (bom_Id != null) {
//          bomList = bomService.getBOMById(bom_Id); // 특정 bom_Id에 대한 리스트를 가져옴
//      } else {
//          bomList = bomService.listBOM(); // 모든 BOM 목록 가져오기
//      }
//
//      // 전체 항목 수와 페이지 수 계산
//      int totalItems = bomList.size();
//      int totalPages = (totalItems + pageSize - 1) / pageSize;  // 전체 페이지 수 계산
//
//      // 현재 페이지에 해당하는 데이터만 잘라서 서브리스트로 전송
//      int startIndex = (page - 1) * pageSize;
//      int endIndex = Math.min(startIndex + pageSize, totalItems);
//      List<BOMDTO> paginatedList = bomList.subList(startIndex, endIndex);
//
//      // 모델에 데이터를 추가
//      model.addAttribute("list", paginatedList);
//      model.addAttribute("currentPage", page);
//      model.addAttribute("totalPages", totalPages);
//      model.addAttribute("bom_Id", bom_Id);
//
//      return "BOM";
//  }
	
//	@RequestMapping(value="/bomUpdate", method=RequestMethod.POST)
//	public String updateBOM(Model model, BOMDTO bomDTO) {
//		
//		int result = bomService.updateBOM(bomDTO);
//		System.out.println("bom update 실행: " + result);
//		System.out.println("BOM DTO: "+ bomDTO);
//		String bomId=bomDTO.getBom_Id();
//		
//		System.out.println("bomId: "+bomId);
//		
//		return "redirect:/bom?bom_Id=bomId";
//	}
    
	
}
