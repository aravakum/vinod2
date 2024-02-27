@EndUserText.label: 'Travel projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI:{
headerInfo:{ typeName:'Travel',typeNamePlural:'Travels',
title: {type : #STANDARD,label:'Travel', value: 'travel_id' }
}}
@Search.searchable: true
define root view entity zvc_travel_pro_M_3
provider contract transactional_query
as projection on zvc_travel_m_3
{

@UI.facet: [{id : 'Travel',
purpose: #STANDARD,
type: #IDENTIFICATION_REFERENCE,
label: 'Travel',
position: 10},
{
id: 'Booking',
purpose: #STANDARD,
type: #LINEITEM_REFERENCE,
label: 'Booking',
position: 20,
targetElement: '_Booking'
}
]
@UI: { lineItem : [{ position: 10, importance: #HIGH }],
identification:[{position: 10, label:'Travel id'}] }
@Search.defaultSearchElement: true
key TravelId as travel_id,
@UI: { lineItem : [{ position: 20, importance: #HIGH }],
identification:[{position: 20, label:'Agency id'}],
selectionField: [{ position: 20 }] }

AgencyId as agency_id,
@UI: { lineItem : [{ position: 30, importance: #HIGH }],
identification:[{position: 30 }],
selectionField: [{ position: 30 }] }

CustomerId as customer_id,
@UI: { lineItem : [{ position: 40, importance: #HIGH }],
identification:[{position: 40 }],
selectionField: [{ position: 40 }] }
BeginDate as begin_date,
@UI: { lineItem : [{ position: 50, importance: #HIGH }],
identification:[{position: 50 }],
selectionField: [{ position: 50 }] }
EndDate as end_date,
@UI: { lineItem : [{ position: 60, importance: #HIGH }],
identification:[{position: 60 }],
selectionField: [{ position: 60 }] }
@Semantics.amount.currencyCode : 'currency_code'
BookingFee as booking_fee,
@UI: { lineItem : [{ position: 70, importance: #HIGH }],
identification:[{position: 70 }] }
@Semantics.amount.currencyCode : 'currency_code'
TotalPrice as total_price,
@UI: { lineItem : [{ position: 80, importance: #HIGH }],
identification:[{position: 80 }] }
@Semantics.currencyCode: true
CurrencyCode as currency_code,
@UI: { lineItem : [{ position: 90, importance: #HIGH }],
identification:[{position: 90 }]}
Description as description,
@UI: { lineItem : [{ position: 100, importance: #HIGH }],
identification:[{position: 100 }] }
OverallStatus as overall_status,
@UI.hidden: true
CreatedBy as created_by,
@UI.hidden: true
CreatedAt as created_at,
@UI.hidden: true
LastChangedBy as lastchanged_by,
@UI.hidden: true
LastChangedAt as lastchanged_at,
/* Associations */
_Agency,
_Booking : redirected to composition child ZVC_BOOKING_PRO_M_3,
_Currency,
_Customer
}
