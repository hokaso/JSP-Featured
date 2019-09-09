package Pet.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import Pet.dao.FooterDao;
import Pet.entity.SiteInfoPO;
import Pet.service.FooterService;

/**
 * Created by GUOFENG on 2017/5/7.
 */
@Service
public class FooterServiceImpl implements FooterService {
	@Resource
    private FooterDao footerDao;

    public void setFooterDao(FooterDao footerDao) {
        this.footerDao = footerDao;
    }

    @Override
    public SiteInfoPO findFooter(int wsId) {
        return footerDao.findFooter(wsId);
    }
}
