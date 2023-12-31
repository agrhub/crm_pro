package com.kakarote.bi.controller;

import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.alibaba.fastjson.JSONObject;
import com.kakarote.bi.service.BiEmployeeService;
import com.kakarote.core.common.Result;
import com.kakarote.core.feign.crm.entity.BiParams;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.kakarote.core.utils.BaseUtil.getResponse;

@RestController
@RequestMapping("/biEmployee")
@Api(tags = "员工业绩分析模块")
@Slf4j
public class BiEmployeeController {

    @Autowired
    private BiEmployeeService biEmployeeService;


    @ApiOperation("合同数量分析")
    @PostMapping("/contractNumStats")
    public Result<List<JSONObject>> contractNumStats(@RequestBody BiParams biParams) {
        biParams.setType("contractNum");
        List<JSONObject> objectList = biEmployeeService.contractNumStats(biParams);
        return Result.ok(objectList);
    }

    @ApiOperation("合同数量分析导出")
    @PostMapping("/contractNumStatsExport")
    public void contractNumStatsExport(@RequestBody BiParams biParams) {
        biParams.setType("contractNum");
        List<JSONObject> recordList = biEmployeeService.contractNumStats(biParams);
        List<Map<String, Object>> list = new ArrayList<>();
        List<String> monthList = new ArrayList<>();
        Map<String, Object> thisMonth = new HashMap<>();
        thisMonth.put("type", "Number of contracts in the month (piece)");
        Map<String, Object> lastMonthGrowth = new HashMap<>();
        lastMonthGrowth.put("type", "Chain growth（%）");
        Map<String, Object> lastYearGrowth = new HashMap<>();
        lastYearGrowth.put("type", "Year-on-year growth（%）");
        recordList.forEach(record -> {
            monthList.add(record.getString("month"));
            thisMonth.put(record.getString("month"), record.getString("thisMonth"));
            lastMonthGrowth.put(record.getString("month"), record.getString("lastMonthGrowth"));
            lastYearGrowth.put(record.getString("month"), record.getString("lastYearGrowth"));
        });
        list.add(thisMonth);
        list.add(lastMonthGrowth);
        list.add(lastYearGrowth);
        try (ExcelWriter writer = ExcelUtil.getWriter()) {
            writer.addHeaderAlias("type", "Date");
            monthList.forEach(month -> writer.addHeaderAlias(month, month));
            writer.merge(12, "Contract Quantity Analysis");
            HttpServletResponse response = getResponse();
            writer.setOnlyAlias(true);
            writer.write(list, true);
            writer.setRowHeight(0, 20);
            writer.setRowHeight(1, 20);
            for (int i = 0; i < 13; i++) {
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
            response.setHeader("Content-Disposition", "attachment;filename=contractNumStats.xls");
            ServletOutputStream out = response.getOutputStream();
            writer.flush(out);
        } catch (Exception e) {
            log.error("contractNumStatsExport error：", e);
        }
    }

    @ApiOperation("合同金额分析")
    @PostMapping("/contractMoneyStats")
    public Result<List<JSONObject>> contractMoneyStats(@RequestBody BiParams biParams) {
        biParams.setType("contractMoney");
        List<JSONObject> objectList = biEmployeeService.contractNumStats(biParams);
        return Result.ok(objectList);
    }

    @ApiOperation("合同金额分析导出")
    @PostMapping("/contractMoneyStatsExport")
    public void contractMoneyStatsExport(@RequestBody BiParams biParams) {
        biParams.setType("contractMoney");
        List<JSONObject> recordList = biEmployeeService.contractNumStats(biParams);
        List<Map<String, Object>> list = new ArrayList<>();
        List<String> monthList = new ArrayList<>();
        Map<String, Object> thisMonth = new HashMap<>();
        thisMonth.put("type", "Contract amount of the month (đồng)");
        Map<String, Object> lastMonthGrowth = new HashMap<>();
        lastMonthGrowth.put("type", "Chain growth（%）");
        Map<String, Object> lastYearGrowth = new HashMap<>();
        lastYearGrowth.put("type", "Year-on-year growth（%）");
        recordList.forEach(record -> {
            monthList.add(record.getString("month"));
            thisMonth.put(record.getString("month"), record.getString("thisMonth"));
            lastMonthGrowth.put(record.getString("month"), record.getString("lastMonthGrowth"));
            lastYearGrowth.put(record.getString("month"), record.getString("lastYearGrowth"));
        });
        list.add(thisMonth);
        list.add(lastMonthGrowth);
        list.add(lastYearGrowth);
        try (ExcelWriter writer = ExcelUtil.getWriter()) {
            writer.addHeaderAlias("type", "Date");
            monthList.forEach(month -> writer.addHeaderAlias(month, month));
            writer.merge(12, "Contract Amount Analysis");
            HttpServletResponse response = getResponse();
            writer.setOnlyAlias(true);
            writer.write(list, true);
            writer.setRowHeight(0, 20);
            writer.setRowHeight(1, 20);
            for (int i = 0; i < 13; i++) {
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
            response.setHeader("Content-Disposition", "attachment;filename=contractMoneyStats.xls");
            ServletOutputStream out = response.getOutputStream();
            writer.flush(out);
        } catch (Exception e) {
            log.error("contractMoneyStatsExport error：", e);
        }
    }

    @ApiOperation("回款金额分析")
    @PostMapping("/receivablesMoneyStats")
    public Result<List<JSONObject>> receivablesMoneyStats(@RequestBody BiParams biParams) {
        biParams.setType("receivables");
        List<JSONObject> objectList = biEmployeeService.contractNumStats(biParams);
        return Result.ok(objectList);
    }

    @ApiOperation("回款金额分析导出")
    @PostMapping("/receivablesMoneyStatsExport")
    public void receivablesMoneyStatsExport(@RequestBody BiParams biParams) {
        biParams.setType("receivables");
        List<JSONObject> recordList = biEmployeeService.contractNumStats(biParams);
        List<Map<String, Object>> list = new ArrayList<>();
        List<String> monthList = new ArrayList<>();
        Map<String, Object> thisMonth = new HashMap<>();
        thisMonth.put("type", "Receivable amount of the month (đồng)");
        Map<String, Object> lastMonthGrowth = new HashMap<>();
        lastMonthGrowth.put("type", "Chain growth（%）");
        Map<String, Object> lastYearGrowth = new HashMap<>();
        lastYearGrowth.put("type", "Year-on-year growth（%）");
        recordList.forEach(record -> {
            monthList.add(record.getString("month"));
            thisMonth.put(record.getString("month"), record.getString("thisMonth"));
            lastMonthGrowth.put(record.getString("month"), record.getString("lastMonthGrowth"));
            lastYearGrowth.put(record.getString("month"), record.getString("lastYearGrowth"));
        });
        list.add(thisMonth);
        list.add(lastMonthGrowth);
        list.add(lastYearGrowth);
        try (ExcelWriter writer = ExcelUtil.getWriter()) {
            writer.addHeaderAlias("type", "Date");
            monthList.forEach(month -> writer.addHeaderAlias(month, month));
            writer.merge(12, "Analysis of the Receivable Amount");
            HttpServletResponse response = getResponse();
            writer.setOnlyAlias(true);
            writer.write(list, true);
            writer.setRowHeight(0, 20);
            writer.setRowHeight(1, 20);
            for (int i = 0; i < 13; i++) {
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
            response.setHeader("Content-Disposition", "attachment;filename=receivablesMoneyStats.xls");
            ServletOutputStream out = response.getOutputStream();
            writer.flush(out);
        } catch (Exception e) {
            log.error("receivablesMoneyStatsExport error：", e);
        }
    }


    @ApiOperation("合同汇总表")
    @PostMapping("/totalContract")
    public Result<JSONObject> totalContract(@RequestBody BiParams biParams) {
        JSONObject jsonObject = biEmployeeService.totalContract(biParams);
        return Result.ok(jsonObject);
    }

    @ApiOperation("合同汇总表导出")
    @PostMapping("/totalContractExport")
    public void totalContractExport(@RequestBody BiParams biParams) {
        JSONObject record = biEmployeeService.totalContract(biParams);
        List<JSONObject> recordList = record.getJSONArray("list").toJavaList(JSONObject.class);
        List<Map<String, Object>> list = new ArrayList<>(recordList);
        try (ExcelWriter writer = ExcelUtil.getWriter()) {
            writer.addHeaderAlias("type", "Date");
            writer.addHeaderAlias("contractNum", "Number of signed contracts (piece)");
            writer.addHeaderAlias("contractMoney", "Contract amount (đồng)");
            writer.addHeaderAlias("receivablesMoney", "Receipt amount (đồng)");
            writer.merge(3, "Contract Summary");
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
            response.setHeader("Content-Disposition", "attachment;filename=totalContract.xls");
            ServletOutputStream out = response.getOutputStream();
            writer.flush(out);
        } catch (Exception e) {
            log.error("totalContractExport error：", e);
        }
    }

    @ApiOperation("发票统计")
    @PostMapping("/invoiceStats")
    public Result<JSONObject> invoiceStats(@RequestBody BiParams biParams) {
        JSONObject jsonObject = biEmployeeService.invoiceStats(biParams);
        return Result.ok(jsonObject);
    }

    @ApiOperation("发票统计导出")
    @PostMapping("/invoiceStatsExport")
    public void invoiceStatsExport(@RequestBody BiParams biParams) {
        JSONObject jsonObject = biEmployeeService.invoiceStats(biParams);
        List<JSONObject> recordList =jsonObject.getJSONArray("list").toJavaList(JSONObject.class);
        try (ExcelWriter writer = ExcelUtil.getWriter()) {
            writer.addHeaderAlias("type", "Date");
            writer.addHeaderAlias("receivablesMoney", "Receipt amount (đồng)");
            writer.addHeaderAlias("invoiceMoney", "Invoice amount (đồng)");
            writer.addHeaderAlias("receivablesNoInvoice", "Payment has been received but not invoiced (đồng)");
            writer.addHeaderAlias("invoiceNoReceivables", "Invoiced but not refunded (đồng)");
            writer.merge(4, "Invoice Statistical Analysis");
            HttpServletResponse response = getResponse();
            writer.setOnlyAlias(true);
            writer.write(recordList, true);
            writer.setRowHeight(0, 20);
            writer.setRowHeight(1, 20);
            for (int i = 0; i < 5; i++) {
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
            response.setHeader("Content-Disposition", "attachment;filename=invoiceStats.xls");
            ServletOutputStream out = response.getOutputStream();
            writer.flush(out);
        } catch (Exception e) {
            log.error("invoiceStatsExport error: ", e);
        }
    }
}
