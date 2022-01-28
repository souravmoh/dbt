select *,{{final_bo_transformation_1('ISSUE_PX','PCS_QUOTE_TYP')}} as OfferPrice,
{{final_bo_transformation_2('BEARER','REGISTERED')}} as SecurityFormType,
{{final_bo_transformation_3_and_4('TICKER','PAR_AMT','MIN_PIECE')}} as minimumTradeSize,
{{final_bo_transformation_3_and_4('TICKER','PAR_AMT','MIN_INCREMENT')}} as RoundLotSize,
{{final_bo_transformation_5('PAR_AMT','PCT_PAR_QUOTED')}} as NominalValueOfUnit,
{{final_bo_transformation_6('"CALLED "')}} as calleventtype
from destination.public.final_bo
