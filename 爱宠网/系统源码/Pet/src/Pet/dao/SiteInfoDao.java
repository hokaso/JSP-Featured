package Pet.dao;

import Pet.entity.SiteInfoPO;

/**
 * Created by GUOFENG on 2017/4/17.
 */
public interface SiteInfoDao {
    SiteInfoPO findInfo(int wsId);

    void saveOrUpdateInfo(SiteInfoPO siteInfoPO);
}
