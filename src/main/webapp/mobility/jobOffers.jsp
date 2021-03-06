<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic"%>
<%@ taglib uri="http://fenix-ashes.ist.utl.pt/fenix-renderers" prefix="fr"%>

<h2><bean:message bundle="MOBILITY_RESOURCES" key="label.module.mobility.jobOffers" /> </h2>


<p class="mtop1 mbottom05">
	<html:link action="/mobility.do?method=prepareToCreateJobOffer">
		<bean:message bundle="MOBILITY_RESOURCES" key="label.module.mobility.jobOffers.create" />
	</html:link>
</p>

<fr:form action="/mobility.do?method=jobOffers">
	<fr:edit id="offerSearch" name="offerSearch">
		<fr:schema type="module.mobility.domain.util.OfferSearch" bundle="MOBILITY_RESOURCES">
			<fr:slot name="processNumber" key="label.mobility.processIdentification">
				<fr:property name="size" value="10"/>
			</fr:slot>
			<fr:slot name="offerSearchOwner" key="label.module.mobility.jobOffers" required="true">
				<fr:property name="defaultOptionHidden" value="true"/>
			</fr:slot>
			
			<%  module.mobility.domain.MobilitySystem mobilitySystem = module.mobility.domain.MobilitySystem.getInstance();
			if (mobilitySystem.isManagementMember()) { %>
				<fr:slot name="mobilityProcessStage" key="label.mobility.state" required="true">
					<fr:property name="excludedValues" value="CONCLUDED_CANDIDACY"/>
					<fr:property name="defaultOptionHidden" value="true"/>
				</fr:slot>
			<%} else { %>
				<fr:slot name="offerSearchState" key="label.mobility.state" required="true">
					<fr:property name="defaultOptionHidden" value="true"/>
				</fr:slot>
			<%}%>
		</fr:schema>
		<fr:layout name="tabular">
			<fr:property name="classes" value="form" />
			<fr:property name="columnClasses" value=",,tderror" />
		</fr:layout>
	</fr:edit>
	<html:submit styleClass="inputbutton">
		<bean:message  bundle="MOBILITY_RESOURCES" key="label.mobility.submit"/>
	</html:submit>
</fr:form>

<logic:present name="processes">
	<logic:empty name="processes">
		<p>
			<em><bean:message bundle="MOBILITY_RESOURCES" key="label.mobility.jobOffer.none"/></em>
		</p>
	</logic:empty>
	<logic:notEmpty name="processes">
		<fr:view name="processes">
			<fr:layout name="tabular">
				<fr:property name="classes" value="tstyle3 mtop2 mbottom1 width100pc punits tdtop"/>
				<fr:property name="columnClasses" value=",,,,,nowrap"/>
				<fr:property name="linkGroupSeparator" value=" | "/>
				
				<fr:property name="link(view)" value="/mobility.do?method=viewJobOfferProcess" />
				<fr:property name="key(view)" value="label.mobility.view" />
				<fr:property name="param(view)" value="OID" />
				<fr:property name="bundle(view)" value="MOBILITY_RESOURCES" />
				
				<fr:property name="link(manage)" value="/mobility.do?method=viewJobOfferProcessToManage" />
				<fr:property name="key(manage)" value="label.mobility.manage" />
				<fr:property name="param(manage)" value="OID" />
				<fr:property name="bundle(manage)" value="MOBILITY_RESOURCES" />
				<fr:property name="visibleIf(manage)" value="canManageProcess" />
				<%-- 
				<fr:property name="link(candidacies)" value="/mobility.do?method=viewJobOfferCandidacies" />
				<fr:property name="key(candidacies)" value="label.mobility.jobOffer.candidacies" />
				<fr:property name="param(candidacies)" value="OID" />
				<fr:property name="bundle(candidacies)" value="MOBILITY_RESOURCES" />
				<fr:property name="visibleIf(candidacies)" value="canManageJobOfferCandidacies" />
				--%>
			</fr:layout>
			<fr:schema bundle="MOBILITY_RESOURCES" type="module.mobility.domain.JobOfferProcess">
				<fr:slot name="jobOffer.jobOfferProcess.processIdentification" key="label.mobility.jobOfferProcessIdentification" />
				<fr:slot name="jobOffer.publicationBeginDate" key="label.mobility.approvalDate" layout="null-as-label"/>
				<fr:slot name="jobOffer.publicationEndDate" key="label.mobility.candicaciesDeadline" layout="null-as-label"/>
				<fr:slot name="jobOffer.workplacePath" key="label.mobility.jobOffer.workplace" />
				<fr:slot name="jobOffer.jobProfile" key="label.mobility.jobOffer.jobProfile" />
			</fr:schema>
		</fr:view>
	</logic:notEmpty>
</logic:present>
