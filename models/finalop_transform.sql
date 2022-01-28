select *,{{finalop_transformation_1('issue_px','pcs_quote_typ')}} as OfferPrice,
{{finalop_transformation_2('bearer','registered')}} as SecurityFormType,
{{finalop_transformation_3_and_4('ticker','par_amt','min_piece')}} as minimumTradeSize,
{{finalop_transformation_3_and_4('ticker','par_amt','min_increment')}} as RoundLotSize,
{{finalop_transformation_5('par_amt','pct_par_quoted')}} as NominalValueOfUnit,
{{finalop_transformation_6('"canadaLLED "')}} as calleventtype
from destination.public.finalop
