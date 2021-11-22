# README

## Require

Human Resource Management System 				
I. Back-end				
 1. Create database to manage all staffs of a company (at least 200 staffs)				
 2. Database can be updateable (add more column, table, backup data)				
II. Front-end				
- Main screen display list departments of a company (at least 3 departments). 				
- Select a department will show next screen where list all staffs of that department using ListView (data get from database above, pageable/paging with 30 staffs per page, load next page when scroll reach end of listview), left-job staff background (of item in listview) is grey and other is white				
- Select one staff of listview above to view staff profile detail: place of birth, birthday, phone number, position in company, status (trainee. internship, official staff)				
- From main screen, you can design a button (or any view) for adding more staff, click on this show view with the form to input data of staff				
- From main screen, has search function to search a staff by department or name or phone number				
- From Listview (list staff) you can long-click to edit staff information				

## DB

https://drive.google.com/file/d/1t0K3Y_zucoBFBulGQF-DHeNdemleZSoJ/view?usp=sharing

## Feature

- Department
    + update/create if user is admin
    + click department > link all user by department

- User
    + Allow update if user is admin or current user
    + Delete/create/update if user is admin

## Bug

- Memem ber can update position > done
- Position not reden by user > done
- Route delete not woking > delete user > reden show (not receive method delete) > done
- Confirm when delete user 
- Click department return user, paginate not active > done
- Staff update, alert if update fail > done
- Staff can't update position > done

## Optimization

- click department return all user of that department > Use onclick(href) > User.search(where(dept_id==..)) 
- Code js   
- Nested route
