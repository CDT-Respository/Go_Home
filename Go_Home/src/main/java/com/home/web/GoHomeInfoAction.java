package com.home.web;

import com.home.entity.GoHomeInfo;
import com.home.entity.entity_android;
import com.home.service.GoHomeInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by SChen on 2017/12/21.
 */
@Controller
@RequestMapping("/goHomeInfoAction")
public class GoHomeInfoAction {
    @Resource(name = "goHomeInfoService")
    private GoHomeInfoService goHomeInfoService;
    private SimpleDateFormat losssdf=new SimpleDateFormat("yyyy-MM-dd");

    //用户发布寻找信息
    @RequestMapping("doGoHomeInfo")
    public String doGoHomeInfo(GoHomeInfo goHomeInfo, MultipartFile gfile,String losstime, int user_no, Model model,HttpSession session){
        if (gfile.isEmpty()) {//如果用户没有选择信息图片，用默认图片
            goHomeInfo.setGohomeinfo_image("20171119下载.png");
        }else{
            //获取服务器路径
            String basePath = session.getServletContext().getRealPath("/images");
            String realName = gfile.getOriginalFilename();//真实上传的文件名
            System.out.println("要上传的文件名是:" + realName);
            //执行上传操作
            try {
                // 定义文件名，文件名根据时间区分
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
                String d = sdf.format(new Date());
                gfile.transferTo(new File(basePath + "/" + d + realName));
                goHomeInfo.setGohomeinfo_image("images/" + d + realName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        //设置时间
        try {
            goHomeInfo.setGohomeinfo_losstime(losssdf.parse(losstime));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if(goHomeInfoService.doGoHomeInfo(goHomeInfo,user_no)){//发布成功
            return "redirect:/DoGoHomeInfo.jsp?status=1";
        }else{//发布失败
            return "redirect:/DoGoHomeInfo.jsp?status=2";
        }

    }

    //查询所有信息
    @RequestMapping("/findGoHomeInfo")
    @ResponseBody
    public List findGoHomeInfo(int thispage,String mysheng,String myshi,String myqu,int thistype){
        List list=goHomeInfoService.findGoHomeInfo(thispage,mysheng,myshi,myqu,thistype);
        if(list!=null){
            return list;
        }
        return null;
    }

    //查询信息总条数
    @RequestMapping("/findGoHomeInfoCount")
    @ResponseBody
    public List findGoHomeInfoCount( String mysheng, String myshi, String myqu,int thistype){
        return goHomeInfoService.findGoHomeInfoCount(mysheng,myshi,myqu,thistype);
    }

    //去到详情页
    @RequestMapping("/toShowAllInfo")
    public String  toShowAllInfo(int info_user_no,int gohomeinfo_no,Model model){
        model.addAttribute("allInfo",goHomeInfoService.findGoHomeAllInfo(info_user_no,gohomeinfo_no));
        return "showGohomeAllInfo";
    }

    //返回给android一个对象
    @RequestMapping("/toShowAllInfo_Android")
    @ResponseBody
    public entity_android toShowAllInfo_Android(int info_user_no, int gohomeinfo_no){
        List list=goHomeInfoService.findGoHomeAllInfo(info_user_no,gohomeinfo_no);
        Object[] obj=(Object[])list.get(0);
        System.out.println(obj[1]);
        entity_android androidentity = new entity_android();
        androidentity.setGohomeinfo_name(obj[1].toString());
        androidentity.setGohomeinfo_age(obj[5].toString());
        androidentity.setGohomeinfo_sex(obj[6].toString());
        androidentity.setGohomeinfo_detailedinfo(obj[2].toString());
        androidentity.setGohomeinfo_image(obj[10].toString());
        androidentity.setGohomeinfo_lossaddress(obj[3].toString());
        androidentity.setGohomeinfo_losstime(obj[4].toString().substring(0,10));
        androidentity.setUserinfo_name(obj[16].toString());
        androidentity.setUserinfo_tel(obj[18].toString());
        return androidentity;
    }


    public void setGoHomeInfoService(GoHomeInfoService goHomeInfoService) {
        this.goHomeInfoService = goHomeInfoService;
    }
}
