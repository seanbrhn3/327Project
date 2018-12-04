use UMD_events;

create or replace view find_events_and_orgs as
select event_name, organization_name, date_format(event_date,"%Y/%d/%m")
from UMD_events.Events join Org_Events using(Event_id)
join UMD_events.Organization using(organization_id) where UMD_events.Events.Dresscode_Dress_code_id = 1;

create or replace view find_all_professionals_and_if_they_have_food as

select UMD_events.Organization.organization_name,UMD_events.Organization.Organization_description, UMD_events.Events.Food
from  UMD_events.Events join  Org_Events using(Event_id) join UMD_events.Organization  using(Organization_id)join UMD_events.Organization Type using(OrganizationType_id)
where OrganizationType_id = 3 and Food=True group by UMD_events.Organization.organization_name;

create or replace view what_items_to_bring as
select UMD_events.Events.Event_name, UMD_events.Items_to_bring.Items
from Items_to_bring join UMD_events.Events on Items_to_bring.Events_id = UMD_events.Events.Event_id
 where is_items = True;
