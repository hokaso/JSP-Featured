package Pet.service.impl;
import Pet.dao.SiteInfoDao;
import Pet.entity.SiteInfoPO;
import Pet.service.SiteInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * Created by GUOFENG on 2017/4/17.
 */
@Service
public class SiteInfoServiceImpl implements SiteInfoService {
	@Autowired
    private SiteInfoDao siteInfoDao;

    @Override
    public SiteInfoPO findInfo(int wsId) {
        return siteInfoDao.findInfo(wsId);
    }

    @Override
    public void saveInfo(SiteInfoPO siteInfoPO) {
        siteInfoDao.saveOrUpdateInfo(siteInfoPO);
    }
}
