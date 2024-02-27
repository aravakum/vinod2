@EndUserText.label: 'booking suppliments projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI:{
headerInfo:{ typeName:'BookingSupp',typeNamePlural:'BookingSupplements',
title: {type : #STANDARD,label:'BookingSupp', value: 'bookingsupplement_id' }
}}

define view entity ZVC_BOOKINGSUPP_PRO_M_3
as projection on zvc_bookingsupp_M_3
{
@UI: { lineItem : [{ position: 10, importance: #HIGH }],
identification:[{position: 10 }]}
key TravelId as travel_id,
@UI: { lineItem : [{ position: 20, importance: #HIGH }],
identification:[{position: 20 }]}
key BookingId as booking_id,
@UI: { lineItem : [{ position: 30, importance: #HIGH }],
identification:[{position: 30 }]}
key BookingSupplementId as bookingsupplement_id,
@UI: { lineItem : [{ position: 40, importance: #HIGH }],
identification:[{position: 40 }]}
SupplementId as supplement_id,
@UI: { lineItem : [{ position: 50, importance: #HIGH }],
identification:[{position: 50 }]}
@Semantics.amount.currencyCode : 'currency_code'
Price as price,
@UI: { lineItem : [{ position: 60, importance: #HIGH }],
identification:[{position: 60 }]}
@Consumption.valueHelpDefinition: [{ entity: { name: 'I_currency', element: 'Currency' }}]
@Semantics.currencyCode: true
CurrencyCode as currency_code,
@UI.hidden: true
LastChangedAt as lastchanged_at,
/* Associations */
_Booking : redirected to parent ZVC_BOOKING_PRO_M_3,
_Product,
_Travel : redirected to zvc_travel_pro_M_3,
_Supplementtext

}
