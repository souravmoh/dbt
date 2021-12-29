select cpn,NAME,crncy,bearer,junior,senior,series,ticker, ISSUER,country,cpn_typ,cur_cpn,day_cnt,floaier,id_isin,id_mic1,id_mic2,id_mic3,id_mic4,
id_mic5,is_regs,mty_typ,par_amt,putable,rig_jcr,base_cpi,cfi_code,cpn_freq,cv_until,id_cedel,id_dutch,id_italy,id_japan,id_spain,
issue_dt,issue_px,lead_mgr,maturity,oid_bond,sinkable,144A_FLAG,cpn_crncy,cv_sh_par,defaulted,exch_code,id_common,id_danish,id_french,
id_sedol1,id_sedol2,id_sedol3,id_sedol4,id_sedol5,min_piece,nxt_re_dt,reset_idx,stepup_dt,amt_issued,collai_typ,cv_cnvs_px,cv_prov_px,
dual_crncy,extendible,id_belgium,int_acc_dt,nxt_cpn_dt,nxt_put_dt,nxt_put_px,prvt_place,
redemp_val,refix_freq,registered,short_name,stepup_cpn, ID_SWEDISH,announce_dt,cv_start_dt,ex_div_days,flt_pay_day,ID_VALOREN,
id_xtrakier,issuer_bulk,nxt_sink_dt,pfd_rst_dvd,prev_cpn_dt,put_feature,trade_crncy,canadaLLED ,basic_spread,delivery_typ,dtc_eligible,
est_cpn_flag,exchangeable,first_cpn_dt,id_bb_global,id_bb_unique,id_euroclear,is_perpetual,market_issue,nxt_refix_dt,nxt_sink_amt,put_discrete,
redemp_crncy,security_des,security_typ,type_of_bond,calc_typ_des,canadalc_typ,  FEED_SOURCE, IS_DAY_PAYER,cv_cnvs_raiio,id_bb_company,id_luxembourg,
id_weripapier,inflaiion_lag,issuers_stock,last_refix_dt,min_increment,nxt_factor_dt,pcs_quote_typ,pfd_ex_dvd_dt,security_typ2,canadaLLABLE,
canadalled_dt,canadalled_px,days_io_settle,day_payer_freq,dtc_registered,final_maturity,flt_days_prior,guarantor_name,id_bb_security,is_unit_traded,
nxt_par_put_dt,pct_par_quoted,pfd_dvd_pay_dt,removal_reason,amt_outstanding,bbg_unique_code,
cdr_settle_code,first_settle_dt,gilts_ex_dvd_dt,id_bb_guarantor,id_bb_parent_co,ID_EXCH_SYMBOL ,is_current_govt,LONG_COMP_NAME ,nxt_canadall_dt,nxt_canadall_px,reference_index,sinking__factor,structured_note,cdr_country_code,cpn_freq_yld_cnv,cv_cnvs_fexch_ri,cv_common_ticker,id_japan_company,is_soft_canadall,canadall_feaiure,canadall_partial,cntry_of_domicile,country_guarantor,cv_mandaiory_cnvs,id_bb_sec_num_des,market_sector_des,PARENT_COMP_NAME ,undl_id_bb_unique,canadalc_maturity,canadall_discrete,flt_cpn_convention,parent_comp_ticker,penultimate_cpn_dt,sedol1_country_iso,sedol2_country_iso,sedol3_country_iso,sedol4_country_iso,credit_enhancements,ex_div_canadalendar,nxt_par_canadall_dt,security_factorable,SEDOL5_COUNTR Y_ISO,eu_savings_directive,flt_bench_multiplier,id_bb_global_company,contingent_conversion,cv_common_ticker_exch,iso_country_guarantor,sink_schedule_ami_typ, IS_REVERSE_CONVERTIBLE,CNTRY_OF_ INCORPORATION,id_bb_global_company_name,contrib_daia_indicanadaior,first_canadall_dt_issuance,MAKE_WHOLE_canadaLL_SPR EAD,most_recent_reporied_factor,ID_CUnited State Of AmericaIP,inflaiion_linked_indicanadaior,ID_AUnited State Of AmericaTRIAN,TRADE_STAIUnited State Of America,ID_CUnited State Of AmericaIP_REAL,INDUnited State Of AmericaTRY_GROUP,INDUnited State Of AmericaTRY_SECTOR,ISSUER_INDUnited State Of AmericaTRY,SEASONING_STAIUnited State Of America,INDUnited State Of AmericaTRY_SUBGROUP,INSURANCE _STATUnited State Of America,INDUnited State Of AmericaTRY_GROUP_NUM,INDUnited State Of AmericaTRY_SECTOR_NUM,INDUnited State Of AmericaTRY_SUBG ROUP_NUM,_airbyte_ab_id,_airbyte_emitted_at,_airbyte_normalized_at,_airbyte_finalop_hashid,
case
when (issue_px is not null and cast(pcs_quote_typ as int)==2) then 100-issue_px
else issue_px
end as OfferPrice,
case
when (bearer=='Y' and registered=='Y') then 'BEARREG'
when (bearer=='Y' and (registered=='N' or registered is null)) then 'BEARER'
when ((bearer=='N' or bearer is null) and registered=='Y') then 'REGSTRD'
else 'UNKNOWN'
end as SecurityFormType,
case 
when ticker=='MBONO' then min_piece/100
when ticker in ('BLFT','BLTN','BNTNB','BNTNC','BNTNF') then min_piece/1000
when par_amt is not null then min_piece/par_amt
else min_piece
end as minimumTradeSize,
case 
when ticker=='MBONO' then min_increment/100
when ticker in ('BLFT','BLTN','BNTNB','BNTNC','BNTNF') then min_increment/1000
when par_amt is not null then min_increment/par_amt
else min_increment
end as RoundLotSize,
case
when par_amt is not null then par_amt
when pct_par_quoted=='N' then 1
when pct_par_quoted=='Y' then 100
end as NominalValueOfUnit,
case
when called=='Y' then 'FULLY'
else 'INCOMPLETE'
end as calleventtype
from {{ref('stg_hamilton')}}
