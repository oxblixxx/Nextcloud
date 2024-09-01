# FORMS APP
## Installing and Using the Forms App in Nextcloud
-  From the Nextcloud console, click on your avatar icon in the top right corner.
- Select Apps from the dropdown menu, and then navigate to the Organization section.
- Locate the Forms app and click on Enable to install it.

## Setting Up a Form:
- Once installed, the Forms app allows administrators to create forms for users or groups.
- From the navbar icons on the console, locate forms icon.
- Click New Form.
- Forms can include various elements such as decisions, dropdowns, checkboxes, radio buttons, etc.
- To start creating a form, click on Add Question to include a new question in your form.

## Previewing and Sharing the Form:
- After adding your questions, click on View to preview the form.
- To share the form, click on Share, type the group name or individual usernames, and choose the recipients.

## Configuring Form Settings:
- Navigate to Settings to configure options such as expiration dates, anonymous responses, and more.

## Submitting and Viewing Responses:
- Adminstrator can submit the form after completing the form.
- To review the submitted responses, go to the Responses tab, where you'll see a list of users who have answered the form.
  
# TRANSFER APP
The Transfer app in Nextcloud allows users to download files directly from the internet using a URL.

## Enable the Transfer App:
- From the Nextcloud console, click on your avatar icon in the top right corner, then select Apps.
- Navigate to the Files section and locate the Transfer app.
- Click on Enable to activate the app.

## Download Files via URL:
- Once the Transfer app is enabled, go to the Files section by clicking on the Files icon in the installed apps area.
- If needed, select the folder where you want to save the downloaded file.
- Click on the New (+) icon and choose Transfer from URL.
- Paste the file's URL, then set the desired file name and extension.
- The download will begin immediately.
NB: The file isn't functioning correctly, while it's an untested app. It will be looked into.

# TALK APP

Using the Talk App in Nextcloud
The Talk app in Nextcloud facilitates communication through text, voice, and video calls.

## Installing the Talk App:

- From the Nextcloud console, click on your avatar icon in the top right corner and select Apps.
- Navigate to the Files section, locate the Talk app, and click on Enable to activate it.

## Accessing and Using the Talk App:
- Once enabled, the Talk icon will appear in the installed apps area.
- To initiate a conversation, click on the message icon integrated with a plus symbol.
- You can start a text chat or initiate voice and video calls with other users.

## Administrator Settings and Limitations:
- Administrators can impose restrictions on the Talk app's usage.
- To configure these settings, click on your avatar icon, then select Administrator Settings.
- Scroll down to locate the Talk section.
- Here, you can set limitations on who can use the Talk app, initiate calls, or create public and group conversations.

## Setting Up a [TURN Server](https://nextcloud-talk.readthedocs.io/en/latest/TURN/): 
In the current setup, the coturn server is being used to facilitate voice and video calls in Nextcloud Talk. However, it only functions currently when calls are placed through a VPN. This limitation arises because the server is located behind a NAT, and the TURN server is hosted on the same server, which isn't publicly accessible. As a result, calls cannot function without a VPN connection. While the Turn server docs was helpful, here are helpful blogs that provided clarity for setup and debugging which is from Nextcloud Community.
- [blog-1](https://help.nextcloud.com/t/talk-calls-not-working-mostly/129031/10)
- [blog-2](https://help.nextcloud.com/t/nextcloud-box-use-of-static-ip-address/10235/13)
- [blog-3](https://help.nextcloud.com/t/talk-calls-only-work-when-connected-to-local-network-coturn-turn-server-not-working/153872)
- [blog-4](https://forum.cloudron.io/topic/6285/nextcloud-talk-not-connecting-calls/5)
- [blog-5](https://www.netways.de/blog/2017/08/16/setting-up-a-turn-server-for-nextcloud-video-calls/)
  
While a [blog post](https://help.nextcloud.com/t/howto-setup-nextcloud-talk-with-turn-server/30794) advised to setup the coturn server to be publicly accessible. To address this issue, the plan is to set up a TURN server on Azure. The Azure-based TURN server will be publicly accessible, allowing for the testing and verification of call functionality without the need for a VPN. Additionally, considerations for a high-backend server will also be explored to improve performance and reliability.

To enhance the Talk app's functionality, you can set up a TURN server for improved performance in voice and video calls. 

# DECK APP
The Deck app in Nextcloud is a personal planning and project management tool that allows you to organize tasks and collaborate with others.

## Installing the Deck App:

- From the Nextcloud console, click on your avatar icon and navigate to Apps.
- Go to the Organization section, locate the Deck app, and click on Enable to install it.

## Setting Up a Board:
- After installation, you can find the Deck app icon in the installed apps area.
- Click on Deck Settings and enable Deck ID.
- To create a new board, click on Add Board, provide a name for the board, and press Enter.

## Creating Lists and Cards:
- Provide a name for a List on the board and press Enter.
- To add more lists, click on the + icon next to the search bar; this will create new lists horizontally.
- On the created lists, click on the + icon to add cards, this creates the cards vetically.
- Repeat the process to add additional cards as needed.

## Inviting Users to the Board:
- To invite users, locate the hamburger icon integrated with an avatar near the search icon.
- The board can be shared with teams or individual users by searching for them in this section.
- You can grant specific permissions to users by clicking on the three dots next to their name for more options.

## Managing Tags:
- While in the board view, click on Tags to create new tags.
- Tags can be applied to cards for better organization.

## Managing Cards:
- Double-click on a card to open it.
- Click on the three dots to change the viewing type.
- Within the card, you can assign tags and delegate the card to a user.
- To add a due date, click on the + icon next to the calendar icon.
- Select Choose Date to set a future date in the MM/DD/YYYY format.
- The due date can be modified by clicking on the date or deleted by selecting the three dots option.
- Once a task is completed, click on Completed to mark the project as finished.

# TASKS
While the deck app integrates with the task app, they both have different use cases and how it's been detailed

## Creating a Task in the Deck App:
- Click on Add List to create a task list, then press Enter.
- After creating a task, note the share icon next to it. Click on this icon to add users or groups to the task. Then decide if the user should edit.

## Adding and Modifying Tasks:
- To add a task within a list, click on Add a Task and press Enter.
- Click on the task you just added to modify its details.
- You can set a start date, due date, priority, and other relevant details.
- Explore the Details section to adjust these settings.
- Use the Note section to add a description to the task.

## Managing Tasks:
- On an individual task, click on the three dots to access additional options, such as adding a sub-task or deleting the task.
- To change the completion progress color, click on the three dots on the task, use the color picker, press Enter, and then click on the left icon to confirm.

# MAIL APP
The Mail app in Nextcloud allows you to integrate your email accounts directly into the Nextcloud environment.

## Accessing the Mail App:
- Click on the Mail icon in the Nextcloud console.
- Navigate to Mail Settings and select Add Email.

## Adding a Personal Email Account:
- For personal email accounts, use the Auto setup section.
- Enter your email address in the Mail Address field and use an app-specific password as the Password, not the regular password used.
- For Gmail users, you will need to generate an app password. Here is a [video tutorial](https://www.youtube.com/watch?v=74QQfPrk4vE) to guide you through the process.
- Once you have the app password, return to the Nextcloud console, paste the app password, and click Connect.

## Adding a Company Email Account:
- For company email account, use the Manual setup section.
- Enter your email address in the Mail Address field.
- The Mail Address, SMTP User, and IMAP User will all be the same.
- The IMAP Host and SMTP Host details will be provided by your company.
- Set both the IMAP Security and SMTP Security to SSL/TLS.
- Use the password assigned to your email for both the IMAP Password and SMTP Password fields.
- Click Connect to add the email account.

## Finalizing Email Setup:
- After successfully adding the email account, refresh the console.
- Click on the three dots next to the newly added email address and select Account Settings.
- Scroll down to find the Signature section, where you can paste your signature template and add an image if needed.
