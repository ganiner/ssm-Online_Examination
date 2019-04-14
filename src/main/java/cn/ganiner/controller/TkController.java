package cn.ganiner.controller;


import cn.ganiner.pojo.Tk.*;
import cn.ganiner.service.TkService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/tk/")
public class TkController {

    @Autowired
    TkService tkService;

    @RequestMapping(value = "allReadFill.do")
    public  String AllReadFill(Model model){
        List<ProgramFill> readPrograms = tkService.ProgramFillAll();
        model.addAttribute("readPrograms",readPrograms);
        return "page/admin/tk_program_fill";
    }
    @ResponseBody
    @RequestMapping(value = "bypfId.do")
    public ProgramFill findBychId(@RequestBody ProgramFill programFill) {
        ProgramFill programFills = tkService.ByProgramFillId(programFill.getId());
        if (programFills != null) {
            return programFills;
        } else {
            return null;
        }
    }
    @RequestMapping(value = "createpf.do")
    public String CreatePf(ProgramFill programFill){
        tkService.CreateProgramFill(programFill);
        return "redirect:allReadFill.do";
    }
    @RequestMapping(value = "deletepf.do")
    public String DeleteDf(@RequestParam Long id){
        tkService.DeleteProgramFill(id);
        return "redirect:allReadFill.do";
    }
    @RequestMapping(value = "updf.do")
    public String UpDf(ProgramFill programFill){
        tkService.updateProgramFill(programFill);
        return "redirect:allReadFill.do";
    }



    @RequestMapping(value = "blankall.do")
    public String blanksAll(Model model){
        List<Blank>blanks  = tkService.findBlankAll();
        model.addAttribute("blanks",blanks);
        return "page/admin/tk_blank";
    }
    @RequestMapping(value = "findblankId.do")
    @ResponseBody
    public Blank findById(@RequestBody Blank blank){
        Blank blanks =tkService.findBlankId(blank.getId());
        return blanks;
    }
    @RequestMapping(value = "deleteblank.do")
    public String delete(@RequestParam Long id) {
        try {
            tkService.DeleteBlank(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:blankall.do";
    }
    @RequestMapping(value = "createblank.do")
    public String CreateBlank(Blank blank){
        tkService.CreateBlank(blank);
        return "redirect:blankall.do";
    }
    @RequestMapping(value = "upblank.do")
    public String UpBlank(Blank blank){
        tkService.UpdateBlank(blank);
        return "redirect:blankall.do";
    }


    @RequestMapping(value = "allReadProgram.do")
    public String AllReadProgram(Model model){
        List<ReadProgram> readProgram = tkService.ReadProgramAll();
        model.addAttribute("readProgram",readProgram);
        return "page/admin/tk_readprogram";
    }
    @ResponseBody
    @RequestMapping(value = "bypgId.do")
    public ReadProgram findBuId(@RequestBody ReadProgram readProgram){
        ReadProgram readPrograms = tkService.ByReadProgramId(readProgram.getId());
        if(readPrograms != null){
            return readPrograms;
        }else {
            return null;
        }
    }
    @RequestMapping(value = "deletepg.do")
    public String DeleteDg(@RequestParam Long id){
        tkService.DeleteReadProgram(id);
        return "redirect:allReadProgram.do";
    }
    @RequestMapping(value = "createpg.do")
    public String CreatePg(ReadProgram readProgram){
        tkService.CreateReadProgram(readProgram);
        return "redirect:allReadProgram.do";
    }
    @RequestMapping(value = "updg.do")
    public String UpDg(ReadProgram readProgram){
        tkService.updateReadProgram(readProgram);
        return "redirect:allReadProgram.do";
    }


    @RequestMapping(value = "allPgDesign.do")
    public String AllpgDesign(Model model){
        List<ProgramDesign> readPrograml = tkService.ProgramDesignAll();
        model.addAttribute("readPrograml",readPrograml);
        return "page/admin/tk_program_design";
    }
    @ResponseBody
    @RequestMapping(value = "bypdId.do")
    public ProgramDesign findBdId(@RequestBody ProgramDesign programDesign){
        ProgramDesign programDesigns =tkService.ByProgramDesignId(programDesign.getId());
        if(programDesigns!=null){
            return programDesigns;
        }else {
            return null;
        }
    }
    @RequestMapping(value = "createpd.do")
    public String CreatePd(ProgramDesign programDesign){
        tkService.CreateProgramDesign(programDesign);
        return "redirect:allPgDesign.do";
    }
    @RequestMapping(value = "deletepd.do")
    public String DeleteDd(@RequestParam Long id){
        tkService.DeleteProgramDesign(id);
        return "redirect:allPgDesign.do";
    }
    @RequestMapping(value = "updd.do")
    public String UpDd(ProgramDesign programDesign){
        tkService.updateProgramDesign(programDesign);
        return "redirect:allPgDesign.do";
    }


    @RequestMapping("alljudge")
    public String AllJudge(Model model,@RequestParam(defaultValue = "1") int pn){
        PageHelper.startPage(pn,6);
        List<Judge>judges = tkService.AllJudge();
        PageInfo pageInfo = new PageInfo(judges,5);
        model.addAttribute("pageInfo",pageInfo);

        return "page/admin/tk_judge";
    }


    @RequestMapping(value = "createjudge.do")
    public String CreateJudge(Judge judge){
        tkService.CreateJudge(judge);
        return "redirect:alljudge.do";
    }
    @RequestMapping(value = "deletejudge.do")
    public String DeleteJudge(@RequestParam Long id){
        tkService.DeleteJudge(id);
        return "redirect:alljudge.do";
    }
    @RequestMapping(value = "upjudge.do")
    public String UpJudge(Judge judge){
        tkService.UpdateJudge(judge);
        return "redirect:alljudge.do";
    }

    @ResponseBody
    @RequestMapping(value = "judgeId.do")
    public Judge findJudgeId(@RequestBody Judge judge){
        Judge judges = tkService.findJudgeId(judge.getId());
        if(judges != null){
            return judges;
        }else {
            return null;
        }
    }
    @RequestMapping(value = "deletemanyjudge.do")
    public String ManyJudge(String chk_value){
     tkService.deleteManyJudge(chk_value);
     return "redirect:alljudge.do";
    }

}
