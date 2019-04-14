package cn.ganiner.controller;


import cn.ganiner.pojo.Tk.*;
import cn.ganiner.service.TkService;
import cn.ganiner.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/tea_tk/")
public class Tk_TeacherController {
    @Autowired
    TkService tkService;
    @Autowired
    UserService userService;

    @RequestMapping(value = "tea_allReadFill.do")
    public  String AllReadFill(Model model){
        List<ProgramFill> readPrograms = tkService.ProgramFillAll();
        model.addAttribute("readPrograms",readPrograms);
        return "page/teacher/tea_program_fill";
    }
    @ResponseBody
    @RequestMapping(value = "tea_bypfId.do")
    public ProgramFill findBychId(@RequestBody ProgramFill programFill) {
        ProgramFill programFills = tkService.ByProgramFillId(programFill.getId());
        if (programFills != null) {
            return programFills;
        } else {
            return null;
        }
    }
    @RequestMapping(value = "tea_createpf.do")
    public String CreatePf(ProgramFill programFill){
        tkService.CreateProgramFill(programFill);
        return "redirect:tea_allReadFill.do";
    }
    @RequestMapping(value = "tea_deletepf.do")
    public String DeleteDf(@RequestParam Long id){
        tkService.DeleteProgramFill(id);
        return "redirect:tea_allReadFill.do";
    }
    @RequestMapping(value = "tea_updf.do")
    public String UpDf(ProgramFill programFill){
        tkService.updateProgramFill(programFill);
        return "redirect:tea_allReadFill.do";
    }
    @RequestMapping(value = "tea_blankall.do")
    public String blanksAll(Model model){
        List<Blank>blanks  = tkService.findBlankAll();
        model.addAttribute("blanks",blanks);
        return "page/teacher/tea_blank";
    }
    @RequestMapping(value = "tea_findblankId.do")
    @ResponseBody
    public Blank findById(@RequestBody Blank blank){
        Blank blanks =tkService.findBlankId(blank.getId());
        return blanks;
    }
    @RequestMapping(value = "tea_deleteblank.do")
    public String delete(@RequestParam Long id) {
        try {
            tkService.DeleteBlank(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:tea_blankall.do";
    }
    @RequestMapping(value = "tea_createblank.do")
    public String CreateBlank(Blank blank){

        tkService.CreateBlank(blank);
        return "redirect:tea_blankall.do";
    }
    @RequestMapping(value = "tea_upblank.do")
    public String UpBlank(Blank blank){
        tkService.UpdateBlank(blank);
        return "redirect:tea_blankall.do";
    }
    @RequestMapping(value = "tea_addchoice.do")
    public String createchoice(Choice choice, Model model){
        try{
            userService.createchoice(choice);
            model.addAttribute("message", "保存章节成功");
        }catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:tea_findallchoice.do";
    }
    @RequestMapping(value = "tea_findallchoice.do")
    public String findChoiceAll(Model model, @RequestParam(defaultValue = "1") int pn){
        PageHelper.startPage(pn,6);

        List<Choice>choice = userService.findChoiceAll();
        PageInfo pageInfo = new PageInfo(choice,5);
        model.addAttribute("pageInfo",pageInfo);
        return  "page/teacher/tea_choice";
    }
    @RequestMapping(value = "deletechoiceall.do")
    public String ManyChoice(String chk_value){
        userService.deleteManyChoice(chk_value);
        return "redirect:tea_findallchoice.do";
    }
    @ResponseBody
    @RequestMapping(value = "tea_findBychId.do")
    public Choice findBychId(@RequestBody Choice choice) {
        Choice choice_info = userService.findBychId(choice.getId());
        if (choice_info != null) {
            return choice_info;
        } else {
            return null;
        }
    }
    @RequestMapping(value = "tea_updatech.do")
    public String updatech(Choice choice, Model model) {
        try {
            userService.updatech(choice);
            model.addAttribute("message", "更新老师信息成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:tea_findallchoice.do";
    }

    @RequestMapping(value = "tea_deletech.do")
    public String deletech(@RequestParam Long id, Model model) {
        try {
            userService.deletech(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:tea_findallchoice.do";
    }
    @RequestMapping(value = "tea_allReadProgram.do")
    public String AllReadProgram(Model model){
        List<ReadProgram> readProgram = tkService.ReadProgramAll();
        model.addAttribute("readProgram",readProgram);
        return "page/teacher/tea_readprogram";
    }
    @ResponseBody
    @RequestMapping(value = "tea_bypgId.do")
    public ReadProgram findBuId(@RequestBody ReadProgram readProgram){
        ReadProgram readPrograms = tkService.ByReadProgramId(readProgram.getId());
        if(readPrograms != null){
            return readPrograms;
        }else {
            return null;
        }
    }
    @RequestMapping(value = "tea_deletepg.do")
    public String DeleteDg(@RequestParam Long id){
        tkService.DeleteReadProgram(id);
        return "redirect:tea_allReadProgram.do";
    }
    @RequestMapping(value = "tea_createpg.do")
    public String CreatePg(ReadProgram readProgram){
        tkService.CreateReadProgram(readProgram);
        return "redirect:tea_allReadProgram.do";
    }
    @RequestMapping(value = "tea_updg.do")
    public String UpDg(ReadProgram readProgram){

        tkService.updateReadProgram(readProgram);
        return "redirect:tea_allReadProgram.do";
    }
    @RequestMapping(value = "tea_allPgDesign.do")
    public String AllpgDesign(Model model){
        List<ProgramDesign> readPrograml = tkService.ProgramDesignAll();
        model.addAttribute("readPrograml",readPrograml);
        return "page/teacher/tk_program_design";
    }
    @ResponseBody
    @RequestMapping(value = "tea_bypdId.do")
    public ProgramDesign findBdId(@RequestBody ProgramDesign programDesign){
        ProgramDesign programDesigns =tkService.ByProgramDesignId(programDesign.getId());
        if(programDesigns!=null){
            return programDesigns;
        }else {
            return null;
        }
    }
    @RequestMapping(value = "tea_createpd.do")
    public String CreatePd(ProgramDesign programDesign){
        tkService.CreateProgramDesign(programDesign);
        return "redirect:tea_allPgDesign.do";
    }
    @RequestMapping(value = "tea_deletepd.do")
    public String DeleteDd(@RequestParam Long id){
        tkService.DeleteProgramDesign(id);
        return "redirect:tea_allPgDesign.do";
    }
    @RequestMapping(value = "tea_updd.do")
    public String UpDd(ProgramDesign programDesign){
        tkService.updateProgramDesign(programDesign);
        return "redirect:tea_allPgDesign.do";
    }


    @RequestMapping(value = "allPgDesign.do")
    public String AllPgDesign(Model model){
        List<ProgramDesign> readPrograml = tkService.ProgramDesignAll();
        model.addAttribute("readPrograml",readPrograml);
        return "page/teacher/tk_program_design";
    }
    @RequestMapping(value = "createpd.do")
    public String CreateProgramDesign(ProgramDesign programDesign){
        tkService.CreateProgramDesign(programDesign);
        return "redirect:allPgDesign.do";
    }
    @RequestMapping(value = "deletepd.do")
    public String DeleteProgramDesign(@RequestParam Long id){
        tkService.DeleteProgramDesign(id);
        return "redirect:allPgDesign.do";
    }
    @RequestMapping(value = "updd.do")
    public String UpProgramDesign(ProgramDesign programDesign){
        tkService.updateProgramDesign(programDesign);
        return "redirect:allPgDesign.do";
    }

    @RequestMapping(value = "alljudge.do")
    public String AllJudge(Model model, @RequestParam(defaultValue = "1") int pn){

        PageHelper.startPage(pn,6);
        List<Judge>judges = tkService.AllJudge();
        PageInfo pageInfo = new PageInfo(judges,5);
        model.addAttribute("pageInfo",pageInfo);
        return "page/teacher/tea_judge";
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
