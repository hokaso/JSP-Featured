package Pet.service;


import Pet.entity.SiteInfoPO;


public interface SiteInfoService {
    SiteInfoPO findInfo(int wsId);

    void saveInfo(SiteInfoPO siteInfoPO);
}
