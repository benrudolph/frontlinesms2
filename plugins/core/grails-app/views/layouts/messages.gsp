<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<title><g:layoutTitle default="Messages"/></title>
		<g:layoutHead/>
		<r:require module="messages"/>
		<r:require module="newMessagesCount"/>
		<fsms:render template="/includes"/>
		<fsms:i18n keys="many.selected, poll.label, autoreply.label,
				announcement.label, poll.reply.text,
				poll.reply.text1, poll.reply.text2,
				poll.reply.text3, autoreply.blank.keyword,
				poll.send.messages.none, autoreply.text.none,
				wizard.title.new, popup.title.saved,
				group.join.reply.message,
				group.leave.reply.message, fmessage.new.info,
				fmessage.selected.many,
				wizard.fmessage.edit.title,
				smallpopup.fmessage.delete.title,
				smallpopup.fmessage.export.title,
				popup.cancel, popup.back, wizard.cancel,
				wizard.back, wizard.next, smallpopup.cancel,
				smallpopup.empty.trash.prompt,
				popup.activity.create, popup.help.title,
				smallpopup.folder.title,
				wizard.quickmessage.title,
				smallpopup.fmessage.rename.title,
				popup.next, fmessage.export, popup.done,
				popup.edit, popup.ok, smallpopup.ok,
				smallpopup.rename, smallpopup.delete,
				smallpopup.export, wizard.ok, wizard.create,
				smallpopup.done, smallpopup.create,
				smallpopup.send, wizard.send, popup.ok,
				message.character.count, fmessage.showpolldetails,
				fmessage.hidepolldetails, poll.reply.text5,
				poll.reply.text6, smallpopup.recipients.title, magicwand.title"/>
		<r:script>
			$(function() {  
			   disablePaginationControls();
			});
		</r:script>
		<r:layoutResources/>
	</head>
	<body id="messages-tab">
		<div id="thinking"></div>
		<div id="header">
			<div id="notifications">
				<fsms:render template="/system_notifications"/>
				<fsms:render template="/flash"/>
			</div>
			<fsms:render template="/system_menu"/>
			<fsms:render template="/tabs"/>
		</div>
		<div id="main">
			<fsms:render template="/message/menu"/>
			<div id="content">
				<g:form controller="${params.controller}"
						params="[messageId: messageInstance?.id, searchId: search?.id]">
					<g:hiddenField name="messageSection" value="${messageSection}"/>
					<g:hiddenField name="ownerId" value="${ownerInstance?.id}"/>
					<div id="message-list" class="${(messageSection in ['inbox', 'sent', 'pending', 'trash', 'folder', 'no_search'])? '': 'tall-header'}">
						<fsms:render template="/message/header"/>
						<fsms:render template="/message/message_list"/>
						<g:layoutBody/>
						<fsms:render template="/message/footer"/>
					</div>
					<fsms:render template="/message/message_details"/>
				</g:form>
			</div>
		</div>
		<r:layoutResources/>
	</body>
</html>
