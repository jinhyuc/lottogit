package org.hyucs.controll;

import java.util.List;

import javax.inject.Inject;

import org.hyucs.domain.StoreVO;
import org.hyucs.service.StoreService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/stores")
public class StoreController {
	
	@Inject
	private StoreService service;
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	public ResponseEntity<String> regist(@RequestBody StoreVO svo) {
		ResponseEntity<String> entity = null;
		
		try {
			service.registStore(svo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/listall", method=RequestMethod.GET)
	public ResponseEntity<List<StoreVO>> listall() throws Exception {
		List<StoreVO> list = service.listAll();
		
		return new ResponseEntity<List<StoreVO>>(list, HttpStatus.OK);		
	}
	
	@RequestMapping(value="/del/{storeid}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("storeid") int storeid) {
		ResponseEntity<String> entity = null;
		
		try {
			service.remove(storeid);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
