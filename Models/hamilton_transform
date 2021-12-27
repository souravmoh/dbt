with hamilton as (
    select * from {{ref('stg_hamilton')}}),
final as ( select ISSUE_PX, PCS_QUOTE_TYP,
        case
            when (ISSUE_PX is not null and PCS_QUOTE_TYP==2) then 100-ISSUE_PX
            else ISSUE_PX
        end as OfferPrice
    from hamilton
    select BEARER,REGISTERED, 
          case
            when (BEARER=="Y" and REGISTERED=="Y") then "BEARREG"
            when (BEARER=="Y" and (REGISTERED=="N" or REGISTERED is null)) then "BEARER"
            when ((BEARER=="N" or BEARER is null) and REGISTERED=="Y") then "REGSTRD"
            else "UNKNOWN"
          end as SecurityFormType
    from hamilton
    select TICKER, PAR_AMT, MIN_PIECE,
       case 
           when TICKER=="MBONO" then MIN_PIECE/100
           when TICKER in ('BLFT','BLTN','BNTNB','BNTNC','BNTNF') then MIN_PIECE/1000
           when PAR_AMT is not null then MIN_PIECE/PAR_AMT
           else MIN_PIECE
       end as minimumTradeSize
     from hamilton
select TICKER, PAR_AMT, MIN_INCREMENT,
       case 
           when TICKER=="MBONO" then MIN_INCREMENT/100
           when TICKER in ('BLFT','BLTN','BNTNB','BNTNC','BNTNF') then MIN_INCREMENT/1000
           when PAR_AMT is not null then MIN_INCREMENT/PAR_AMT
           else MIN_INCREMENT
       end as RoundLotSize
     from hamilton
select PAR_AMT,PCT_PAR_QUOTED,
       case
         when PAR_AMT is not null then PAR_AMT
         when PCT_PAR_QUOTED=="N" then 1
         when PCT_PAR_QUOTED=="Y" then 100
       end as NominalValueOfUnit
     from hamilton
select CALLED,
      case
        when CALLED=="Y" then "FULLY"
        else "INCOMPLETE"
      end as calleventtype
   from hamilton
    )
 select * from final
