<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr"%>
<%@ taglib uri="/WEB-INF/workflow.tld" prefix="wf"%>

<bean:define id="jobOffer" name="process" property="jobOffer"/>

<jsp:include page="../module/mobility/domain/JobOfferProcess/header.jsp"/>

<html:link action="/workflowProcessManagement.do?method=viewProcess" paramId="processId" paramName="process" paramProperty="externalId">
	<bean:message bundle="MOBILITY_RESOURCES" key="label.backToProcess"/>
</html:link>

<logic:empty name="jobOffer" property="jobOfferCandidacy">
	<bean:message bundle="MOBILITY_RESOURCES" key="message.mobility.empty.candidateSet"/>
</logic:empty>

<fr:view name="jobOffer" property="jobOfferCandidacy" schema="show.jobOfferCandidacy">
	<fr:layout name="tabular">
		<fr:property name="classes" value="plist mtop05 width100pc"/>
	</fr:layout>
</fr:view>
