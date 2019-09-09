package Pet.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Pet.dao.CountInfoDao;
import Pet.entity.CountInfoPO;
import Pet.service.CountInfoService;

/**
 * Created by GUOFENG on 2017/4/20.
 */
@Service
public class CountInfoServiceImpl implements CountInfoService {
	@Resource
	private CountInfoDao countInfoDao;
	
	private CountInfoPO countInfoPO;
	  public CountInfoPO getCountInfoPO() {
			return countInfoPO;
		}


		public void setCountInfoPO(CountInfoPO countInfoPO) {
			this.countInfoPO = countInfoPO;
		}
	@Override
    public CountInfoPO countInfo() {
		CountInfoPO countInfoPO = new CountInfoPO();
        countInfoPO.setCountUser(countInfoDao.countUser());
        System.out.println(countInfoPO.getCountUser());
        countInfoPO.setCountNews(countInfoDao.countNews());
        countInfoPO.setCountComment(countInfoDao.countComment());
        countInfoPO.setCountLook(countInfoDao.countLook());
        return countInfoPO;
    }
}
