package com.kakarote.bi.controller;

import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.alibaba.fastjson.JSONObject;
import com.kakarote.bi.mapper.BiCustomerMapper;
import com.kakarote.bi.service.BiCustomerService;
import com.kakarote.core.common.Const;
import com.kakarote.core.common.Result;
import com.kakarote.core.entity.BasePage;
import com.kakarote.core.feign.crm.entity.BiParams;
import com.kakarote.core.servlet.ApplicationContextHolder;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.kakarote.core.utils.BaseUtil.getResponse;

@RestController
@RequestMapping("biCustomer")
@Api(tags = "客户商业智能模块")
@Slf4j
public class BiCustomerController {

    @Autowired
    private BiCustomerService biCustomerService;

    @ApiOperation("客户总量分析")
    @PostMapping("/totalCustomerStats")
    public Result<List<JSONObject>> totalCustomerStats(@RequestBody BiParams biParams) {
        List<JSONObject> objectList = biCustomerService.totalCustomerStats(biParams);
        return Result.ok(objectList);
    }

    @ApiOperation("客户总量分析图")
    @PostMapping("/totalCustomerTable")
    public Result<JSONObject> totalCustomerTable(@RequestBody BiParams biParams) {
        JSONObject object = biCustomerService.totalCustomerTable(biParams);
        return Result.ok(object);
    }

    @ApiOperation("客户总量分析图导出")
    @PostMapping("/totalCustomerTableExport")
    public void totalCustomerTableExport(@RequestBody BiParams biParams) {
        JSONObject kv = biCustomerService.totalCustomerTable(biParams);
        List<JSONObject> recordList = kv.getJSONArray("list").toJavaList(JSONObject.class);
        List<Map<String, Object>> list = new ArrayList<>(recordList);
        JSONObject total = kv.getJSONObject("total");
        total.put("dealCustomerRate", "");
        list.add(total);
        try (ExcelWriter writer = ExcelUtil.getWriter()) {
            writer.addHeaderAlias("realname", "Full name");
            writer.addHeaderAlias("customerNum", "Customer No");
            writer.addHeaderAlias("dealCustomerNum", "Deal No");
            writer.addHeaderAlias("dealCustomerRate", "Deal rate");
            writer.addHeaderAlias("contractMoney", "The total amount of the contract");
            writer.addHeaderAlias("receivablesMoney", "Receivables");
            writer.merge(5, "Total customer analysis");
            HttpServletResponse response = getResponse();
            writer.setOnlyAlias(true);
            writer.write(list, true);
            writer.setRowHeight(0, 20);
            writer.setRowHeight(1, 20);
            for (int i = 0; i < 6; i++) {
                writer.setColumnWidth(i, 20);
            }
            Cell cell = writer.getCell(0, 0);
            CellStyle cellStyle = cell.getCellStyle();
            cellStyle.setFillForegroundColor(IndexedColors.SKY_BLUE.getIndex());
            cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            Font font = writer.createFont();
            font.setBold(true);
            font.setFontHeightInPoints((short) 16);
            cellStyle.setFont(font);
            cell.setCellStyle(cellStyle);
            //自定义标题别名
            //response为HttpServletResponse对象
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setCharacterEncoding("UTF-8");
            //test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
            response.setHeader("Content-Disposition", "attachment;filename=totalCustomerTable.xls");
            ServletOutputStream out = response.getOutputStream();
            writer.flush(out);
        } catch (Exception e) {
            log.error("Error in exporting total customer analysis: ", e);
        }
    }

    @ApiOperation("客户跟进次数分析")
    @PostMapping("/customerRecordStats")
    public Result<List<JSONObject>> customerRecordStats(@RequestBody BiParams biParams) {
        List<JSONObject> objectList = biCustomerService.customerRecordStats(biParams);
        return Result.ok(objectList);
    }

    @ApiOperation("客户跟进次数分析表")
    @PostMapping("/customerRecordInfo")
    public Result<JSONObject> customerRecordInfo(@RequestBody BiParams biParams) {
        JSONObject jsonObject = biCustomerService.customerRecordInfo(biParams);
        return Result.ok(jsonObject);
    }

    @ApiOperation("客户跟进次数分析表导出")
    @PostMapping("/customerRecordInfoExport")
    public void customerRecordInfoExport(@RequestBody BiParams biParams) {
        JSONObject kv = biCustomerService.customerRecordInfo(biParams);
        List<JSONObject> recordList = kv.getJSONArray("list").toJavaList(JSONObject.class);
        List<Map<String, Object>> list = new ArrayList<>(recordList);
        JSONObject total = kv.getJSONObject("total");
        list.add(total);
        try (ExcelWriter writer = ExcelUtil.getWriter()) {
            writer.addHeaderAlias("realname", "Full name");
            writer.addHeaderAlias("recordCount", "Follow-up times");
            writer.addHeaderAlias("customerCount", "Follow-up customers");
            writer.merge(2, "Customer follow-up analysis");
            HttpServletResponse response = getResponse();
            writer.setOnlyAlias(true);
            writer.write(list, true);
            writer.setRowHeight(0, 20);
            writer.setRowHeight(1, 20);
            for (int i = 0; i < 3; i++) {
                writer.setColumnWidth(i, 20);
            }
            Cell cell = writer.getCell(0, 0);
            CellStyle cellStyle = cell.getCellStyle();
            cellStyle.setFillForegroundColor(IndexedColors.SKY_BLUE.getIndex());
            cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            Font font = writer.createFont();
            font.setBold(true);
            font.setFontHeightInPoints((short) 16);
            cellStyle.setFont(font);
            cell.setCellStyle(cellStyle);
            //自定义标题别名
            //response为HttpServletResponse对象
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setCharacterEncoding("UTF-8");
            //test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
            response.setHeader("Content-Disposition", "attachment;filename=customerRecordInfo.xls");
            ServletOutputStream out = response.getOutputStream();
            writer.flush(out);
        } catch (Exception e) {
            log.error("Analysis error of export customer follow-up times:", e);
        }
    }


    @ApiOperation("客户跟进方式分析")
    @PostMapping("/customerRecodCategoryStats")
    public Result<List<JSONObject>> customerRecodCategoryStats(@RequestBody BiParams biParams) {
        List<JSONObject> objectList = biCustomerService.customerRecodCategoryStats(biParams);
        return Result.ok(objectList);
    }

    @ApiOperation("客户跟进方式分析导出")
    @PostMapping("/customerRecodCategoryStatsExport")
    public void customerRecodCategoryStatsExport(@RequestBody BiParams biParams) {
        List<JSONObject> objectList = biCustomerService.customerRecodCategoryStats(biParams);
        List<Map<String, Object>> list = new ArrayList<>(objectList);
        JSONObject total = new JSONObject();
        Long totalRecordNum = objectList.stream().collect(Collectors.summarizingInt(r -> r.getInteger("recordNum"))).getSum();
        total.fluentPut("category", "total").fluentPut("recordNum", totalRecordNum).fluentPut("proportion", "100%");
        list.add(total);
        try (ExcelWriter writer = ExcelUtil.getWriter()) {
            writer.addHeaderAlias("category", "Category");
            writer.addHeaderAlias("recordNum", "Number");
            writer.addHeaderAlias("proportion", "Percentage(%)");
            writer.merge(2, "Customer follow-up analysis");
            HttpServletResponse response = getResponse();
            writer.setOnlyAlias(true);
            writer.write(list, true);
            writer.setRowHeight(0, 20);
            writer.setRowHeight(1, 20);
            for (int i = 0; i < 3; i++) {
                writer.setColumnWidth(i, 20);
            }
            Cell cell = writer.getCell(0, 0);
            CellStyle cellStyle = cell.getCellStyle();
            cellStyle.setFillForegroundColor(IndexedColors.SKY_BLUE.getIndex());
            cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            Font font = writer.createFont();
            font.setBold(true);
            font.setFontHeightInPoints((short) 16);
            cellStyle.setFont(font);
            cell.setCellStyle(cellStyle);
            //自定义标题别名
            //response为HttpServletResponse对象
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setCharacterEncoding("UTF-8");
            //test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
            response.setHeader("Content-Disposition", "attachment;filename=customerRecordCategoryStats.xls");
            ServletOutputStream out = response.getOutputStream();
            writer.flush(out);
        } catch (Exception e) {
            log.error("Export customer follow-up method analysis error:", e);
        }
    }


    @ApiOperation("客户转化率分析图")
    @PostMapping("/customerConversionStats")
    public Result<List<JSONObject>> customerConversionStats(@RequestBody BiParams biParams) {
        List<JSONObject> objectList = biCustomerService.customerConversionStats(biParams);
        return Result.ok(objectList);
    }

    @ApiOperation("客户转化率分析表")
    @PostMapping("/customerConversionInfo")
    public Result<BasePage<JSONObject>> customerConversionInfo(@RequestBody BiParams basePageRequest) {
        BasePage<JSONObject> basePage = biCustomerService.customerConversionInfo(basePageRequest);
        return Result.ok(basePage);
    }


    @ApiOperation("公海客户分析图")
    @PostMapping("/poolStats")
    public Result<List<JSONObject>> poolStats(@RequestBody BiParams biParams) {
        List<JSONObject> basePage = biCustomerService.poolStats(biParams);
        return Result.ok(basePage);
    }

    @ApiOperation("公海客户分析表")
    @PostMapping("/poolTable")
    public Result<JSONObject> poolTable(@RequestBody BiParams biParams) {
        JSONObject basePage = biCustomerService.poolTable(biParams);
        return Result.ok(basePage);
    }

    @ApiOperation("公海客户分析表导出")
    @PostMapping("/poolTableExport")
    public void poolTableExport(@RequestBody BiParams biParams) {
        JSONObject kv = biCustomerService.poolTable(biParams);
        List<JSONObject> recordList = kv.getJSONArray("list").toJavaList(JSONObject.class);
        List<Map<String, Object>> list = new ArrayList<>(recordList);
        JSONObject total = kv.getJSONObject("total");
        list.add(total);
        try (ExcelWriter writer = ExcelUtil.getWriter()) {
            writer.addHeaderAlias("realname", "Full name");
            writer.addHeaderAlias("deptName", "Department");
            writer.addHeaderAlias("receiveNum", "Number of received pool customers");
            writer.addHeaderAlias("putInNum", "Number of put in pool customers");
            writer.merge(3, "High seas customer analysis");
            HttpServletResponse response = getResponse();
            writer.setOnlyAlias(true);
            writer.write(list, true);
            writer.setRowHeight(0, 20);
            writer.setRowHeight(1, 20);
            for (int i = 0; i < 4; i++) {
                writer.setColumnWidth(i, 20);
            }
            Cell cell = writer.getCell(0, 0);
            CellStyle cellStyle = cell.getCellStyle();
            cellStyle.setFillForegroundColor(IndexedColors.SKY_BLUE.getIndex());
            cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            Font font = writer.createFont();
            font.setBold(true);
            font.setFontHeightInPoints((short) 16);
            cellStyle.setFont(font);
            cell.setCellStyle(cellStyle);
            //自定义标题别名
            //response为HttpServletResponse对象
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setCharacterEncoding("UTF-8");
            //test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
            response.setHeader("Content-Disposition", "attachment;filename=poolTable.xls");
            ServletOutputStream out = response.getOutputStream();
            writer.flush(out);
        } catch (Exception e) {
            log.error("Export high seas customer analysis error:", e);
        }
    }


    @ApiOperation("员工客户成交周期图")
    @PostMapping("/employeeCycle")
    public Result<List<JSONObject>> employeeCycle(@RequestBody BiParams biParams) {
        List<JSONObject> objectList = biCustomerService.employeeCycle(biParams);
        return Result.ok(objectList);
    }

    @ApiOperation("员工客户成交周期表")
    @PostMapping("/employeeCycleInfo")
    public Result<JSONObject> employeeCycleInfo(@RequestBody BiParams biParams) {
        JSONObject jsonObject = biCustomerService.employeeCycleInfo(biParams);
        return Result.ok(jsonObject);
    }

    @ApiOperation("员工客户成交周期表导出")
    @PostMapping("/employeeCycleInfoExport")
    public void employeeCycleInfoExport(@RequestBody BiParams biParams) {
        JSONObject kv = biCustomerService.employeeCycleInfo(biParams);
        List<JSONObject> recordList = kv.getJSONArray("list").toJavaList(JSONObject.class);
        List<Map<String, Object>> list = new ArrayList<>(recordList);
        JSONObject total = kv.getJSONObject("total");
        total.put("cycle", "");
        list.add(total);
        try (ExcelWriter writer = ExcelUtil.getWriter()) {
            writer.addHeaderAlias("realname", "Full name");
            writer.addHeaderAlias("cycle", "Transaction cycle (days)");
            writer.addHeaderAlias("customerNum", "Number of customers");
            writer.merge(2, "Analysis of employee customer transaction cycle");
            HttpServletResponse response = getResponse();
            writer.setOnlyAlias(true);
            writer.write(list, true);
            writer.setRowHeight(0, 20);
            writer.setRowHeight(1, 20);
            for (int i = 0; i < 3; i++) {
                writer.setColumnWidth(i, 20);
            }
            Cell cell = writer.getCell(0, 0);
            CellStyle cellStyle = cell.getCellStyle();
            cellStyle.setFillForegroundColor(IndexedColors.SKY_BLUE.getIndex());
            cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            Font font = writer.createFont();
            font.setBold(true);
            font.setFontHeightInPoints((short) 16);
            cellStyle.setFont(font);
            cell.setCellStyle(cellStyle);
            //自定义标题别名
            //response为HttpServletResponse对象
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setCharacterEncoding("UTF-8");
            //test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
            response.setHeader("Content-Disposition", "attachment;filename=employeeCycleInfo.xls");
            ServletOutputStream out = response.getOutputStream();
            writer.flush(out);
        } catch (Exception e) {
            log.error("Error in exporting employee customer transaction cycle analysis:", e);
        }
    }


    @ApiOperation("地区成交周期图")
    @PostMapping("/districtCycle")
    public Result<JSONObject> districtCycle(@RequestBody BiParams biParams) {
        JSONObject jsonObject = biCustomerService.districtCycle(biParams);
        return Result.ok(jsonObject);
    }

    @ApiOperation("地区成交周期图导出")
    @PostMapping("/districtCycleExport")
    public void districtCycleExport(@RequestBody BiParams biParams) {
        JSONObject kv = biCustomerService.districtCycle(biParams);
        List<JSONObject> recordList = kv.getJSONArray("list").toJavaList(JSONObject.class);
        List<Map<String, Object>> list = new ArrayList<>(recordList);
        JSONObject total = kv.getJSONObject("total");
        total.put("cycle", "");
        list.add(total);
        try (ExcelWriter writer = ExcelUtil.getWriter()) {
            writer.addHeaderAlias("type", "Area");
            writer.addHeaderAlias("cycle", "Transaction cycle (days)");
            writer.addHeaderAlias("customerNum", "Number of customers");
            writer.merge(2, "Regional transaction cycle analysis");
            HttpServletResponse response = getResponse();
            writer.setOnlyAlias(true);
            writer.write(list, true);
            writer.setRowHeight(0, 20);
            writer.setRowHeight(1, 20);
            for (int i = 0; i < 3; i++) {
                writer.setColumnWidth(i, 20);
            }
            Cell cell = writer.getCell(0, 0);
            CellStyle cellStyle = cell.getCellStyle();
            cellStyle.setFillForegroundColor(IndexedColors.SKY_BLUE.getIndex());
            cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            Font font = writer.createFont();
            font.setBold(true);
            font.setFontHeightInPoints((short) 16);
            cellStyle.setFont(font);
            cell.setCellStyle(cellStyle);
            //自定义标题别名
            //response为HttpServletResponse对象
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setCharacterEncoding("UTF-8");
            //test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
            response.setHeader("Content-Disposition", "attachment;filename=districtCycleInfo.xls");
            ServletOutputStream out = response.getOutputStream();
            writer.flush(out);
        } catch (Exception e) {
            log.error("Analysis error of transaction cycle in export area:", e);
        }
    }

    @ApiOperation("产品成交周期")
    @PostMapping("/productCycle")
    public Result<JSONObject> productCycle(@RequestBody BiParams biParams) {
        JSONObject jsonObject = biCustomerService.productCycle(biParams);
        return Result.ok(jsonObject);
    }

    @ApiOperation("产品成交周期导出")
    @PostMapping("/productCycleExport")
    public void productCycleExport(@RequestBody BiParams biParams) {
        JSONObject kv = biCustomerService.productCycle(biParams);
        List<JSONObject> recordList = kv.getJSONArray("list").toJavaList(JSONObject.class);
        List<Map<String, Object>> list = new ArrayList<>(recordList);
        JSONObject total = kv.getJSONObject("total");
        total.put("cycle", "");
        list.add(total);
        try (ExcelWriter writer = ExcelUtil.getWriter()) {
            writer.addHeaderAlias("productName", "Product name");
            writer.addHeaderAlias("cycle", "Transaction cycle (days)");
            writer.addHeaderAlias("customerNum", "Number of customers");
            writer.merge(2, "Product transaction cycle analysis");
            HttpServletResponse response = getResponse();
            writer.setOnlyAlias(true);
            writer.write(list, true);
            writer.setRowHeight(0, 20);
            writer.setRowHeight(1, 20);
            for (int i = 0; i < 3; i++) {
                writer.setColumnWidth(i, 20);
            }
            Cell cell = writer.getCell(0, 0);
            CellStyle cellStyle = cell.getCellStyle();
            cellStyle.setFillForegroundColor(IndexedColors.SKY_BLUE.getIndex());
            cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            Font font = writer.createFont();
            font.setBold(true);
            font.setFontHeightInPoints((short) 16);
            cellStyle.setFont(font);
            cell.setCellStyle(cellStyle);
            //自定义标题别名
            //response为HttpServletResponse对象
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setCharacterEncoding("UTF-8");
            //test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
            response.setHeader("Content-Disposition", "attachment;filename=productCycleInfo.xls");
            ServletOutputStream out = response.getOutputStream();
            writer.flush(out);
        } catch (Exception e) {
            log.error("Analysis error of export product transaction cycle:", e);
        }
    }

    @ApiOperation("客户满意度分析")
    @PostMapping("/customerSatisfactionTable")
    public Result<List<JSONObject>> customerSatisfactionTable(@RequestBody BiParams biParams) {
        List<JSONObject> objectList = biCustomerService.customerSatisfactionTable(biParams);
        return Result.ok(objectList);
    }

    @ApiOperation("客户满意度分析导出")
    @PostMapping("/customerSatisfactionExport")
    public void customerSatisfactionExport(@RequestBody BiParams biParams) {
        List<JSONObject> objectList = biCustomerService.customerSatisfactionTable(biParams);
        try (ExcelWriter writer = ExcelUtil.getWriter()) {
            JSONObject object = ApplicationContextHolder.getBean(BiCustomerMapper.class).querySatisfactionOptionList();
            List<String> optionList = StrUtil.splitTrim(object.getString("options"), Const.SEPARATOR);
            writer.addHeaderAlias("realname", "Full name");
            writer.addHeaderAlias("visitContractNum", "Total number of return visit contracts");
            optionList.forEach(option -> writer.addHeaderAlias(option, option));
            writer.merge(optionList.size() + 1, "Employee customer satisfaction analysis");
            HttpServletResponse response = getResponse();
            writer.setOnlyAlias(true);
            writer.write(objectList, true);
            writer.setRowHeight(0, 20);
            writer.setRowHeight(1, 20);
            for (int i = 0; i < optionList.size() + 2; i++) {
                writer.setColumnWidth(i, 20);
            }
            Cell cell = writer.getCell(0, 0);
            CellStyle cellStyle = cell.getCellStyle();
            cellStyle.setFillForegroundColor(IndexedColors.SKY_BLUE.getIndex());
            cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            Font font = writer.createFont();
            font.setBold(true);
            font.setFontHeightInPoints((short) 16);
            cellStyle.setFont(font);
            cell.setCellStyle(cellStyle);
            //自定义标题别名
            //response为HttpServletResponse对象
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setCharacterEncoding("UTF-8");
            //test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
            response.setHeader("Content-Disposition", "attachment;filename=customerSatisfaction.xls");
            ServletOutputStream out = response.getOutputStream();
            writer.flush(out);
        } catch (Exception e) {
            log.error("Analysis error of export product transaction cycle:", e);
        }
    }

    @ApiOperation("产品满意度分析")
    @PostMapping("/productSatisfactionTable")
    public Result<List<JSONObject>> productSatisfactionTable(@RequestBody BiParams biParams) {
        List<JSONObject> objectList = biCustomerService.productSatisfactionTable(biParams);
        return Result.ok(objectList);
    }

    @ApiOperation("产品满意度分析导出")
    @PostMapping("/productSatisfactionExport")
    public void productSatisfactionExport(@RequestBody BiParams biParams) {
        List<JSONObject> objectList = biCustomerService.productSatisfactionTable(biParams);
        try (ExcelWriter writer = ExcelUtil.getWriter()) {
            JSONObject object = ApplicationContextHolder.getBean(BiCustomerMapper.class).querySatisfactionOptionList();
            List<String> optionList = StrUtil.splitTrim(object.getString("options"), Const.SEPARATOR);
            writer.addHeaderAlias("productName", "Product name");
            writer.addHeaderAlias("visitNum", "Total number of return visit contracts");
            optionList.forEach(option -> writer.addHeaderAlias(option, option));
            writer.merge(optionList.size() + 1, "Product satisfaction analysis");
            HttpServletResponse response = getResponse();
            writer.setOnlyAlias(true);
            writer.write(objectList, true);
            writer.setRowHeight(0, 20);
            writer.setRowHeight(1, 20);
            for (int i = 0; i < optionList.size() + 2; i++) {
                writer.setColumnWidth(i, 20);
            }
            Cell cell = writer.getCell(0, 0);
            CellStyle cellStyle = cell.getCellStyle();
            cellStyle.setFillForegroundColor(IndexedColors.SKY_BLUE.getIndex());
            cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            Font font = writer.createFont();
            font.setBold(true);
            font.setFontHeightInPoints((short) 16);
            cellStyle.setFont(font);
            cell.setCellStyle(cellStyle);
            //自定义标题别名
            //response为HttpServletResponse对象
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setCharacterEncoding("UTF-8");
            //test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
            response.setHeader("Content-Disposition", "attachment;filename=productSatisfaction.xls");
            ServletOutputStream out = response.getOutputStream();
            writer.flush(out);
        } catch (Exception e) {
            log.error("Analysis error of export product transaction cycle:", e);
        }
    }
}
