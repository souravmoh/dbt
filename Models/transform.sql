1. select issue_px, pcs_quote_typ,
        case
            when (issue_px is not null and pcs_quote_typ==2) then 100-issue_px
            else issue_px
        end as OfferPrice
    from bbg;

2.  select bearer,registered, 
          case
            when (bearer=="Y" and registered=="Y") then "BEARREG"
            when (bearer=="Y" and (registered=="N" or registered is null)) then "BEARER"
            when ((bearer=="N" or bearer is null) and registered=="Y") then "REGSTRD"
            else "UNKNOWN"
          end as SecurityFormType
    from bbg;

3. select ticker, par_amt, min_piece,
       case 
           when ticker=="MBONO" then min_piece/100
           when ticker in ('BLFT','BLTN','BNTNB','BNTNC','BNTNF') then min_piece/1000
           when par_amt is not null then min_piece/par_amt
           else min_piece
       end as minimumTradeSize
     from bbg;

4. select ticker, par_amt, min_increment,
       case 
           when ticker=="MBONO" then min_increment/100
           when ticker in ('BLFT','BLTN','BNTNB','BNTNC','BNTNF') then min_increment/1000
           when par_amt is not null then min_increment/par_amt
           else min_increment
       end as RoundLotSize
     from bbg;

5. select par_amt,pct_par_quoted,
       case
         when par_amt is not null then par_amt
         when pct_par_quoted=="N" then 1
         when pct_par_quoted=="Y" then 100
       end as NominalValueOfUnit
     from bbg;

6. select called,
      case
        when called=="Y" then "FULLY"
        else "INCOMPLETE"
      end as calleventtype
   from bbg;
   
   /* with bbg as (

    select * from {{ ref('stg_bbg') }}

),
hamilton as (
select * from {{ref('stg_hamilton')}}

),
final as ( select ISSUE_PX, PCS_QUOTE_TYP,
        case
            when (ISSUE_PX is not null and PCS_QUOTE_TYP==2) then 100-ISSUE_PX
            else ISSUE_PX
        end as OfferPrice
    from bbg
    )
 select * from final
 */
 

