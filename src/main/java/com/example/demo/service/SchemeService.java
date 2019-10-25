package com.example.demo.service;



import org.springframework.ui.Model;
import com.example.demo.entity.Scheme;

/**
* @author Administrator
* @date 2019年10月8日
* @version 1.0
*/
public interface SchemeService {
	/**
	 * @param scheme
	 * @return
	 */
	int addScheme(Scheme scheme);
	
	/**
	 * @param model
	 * @param projectId
	 */
	void querySchemesByProjectId(Model model, String projectId);
	
	/**
	 * @param model
	 * @param projectId
	 */
	void queryPassSchemes(Model model, String projectId);
	
	/**
	 * @param model
	 * @param id
	 */
	void querySchemeById(Model model, String id);
	/**
	 * @param scheme
	 * @return
	 */
	int updateScheme(Scheme scheme);
	
	/**
	 * @param scheme
	 */
	void addPaddingMatter(Scheme scheme);
}
