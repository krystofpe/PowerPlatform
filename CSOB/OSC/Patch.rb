Set(
    varSpinner,
    true
);
Switch(
    varUserRole,
    "BUCO",
    Patch(
        'QRC Topics Repository',
        LookUp(
            'QRC Topics Repository',
            ID = varRecordQRC.ID
        ),
        {
            Status: {Value: "For IT LORM"},
            'Issue Comment': If(
            Len(Substitute(Substitute(input_Detail_issue_comment_QRC.Text, "Comments for Issue section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Issue Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Issue Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Issue Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_Detail_issue_comment_QRC.Text),
                    varRecordQRC.'Issue Comment',
                    ""
                )
            ), varRecordQRC.'Issue Comment'
        ),
            'Proposed solution Comment': If(
            Len(Substitute(Substitute(input_DetailProposedSolution_comment_QRC.Text, "Comments for Proposed solution section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Proposed solution Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Proposed solution Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Proposed solution Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_DetailProposedSolution_comment_QRC.Text),
                    varRecordQRC.'Proposed solution Comment',
                    ""
                )
            ), varRecordQRC.'Proposed solution Comment'
        ),
        #Old patch ProposedSolutionComment value: If(Len(input_DetailProposedSolution_comment_QRC.Text) > 0,Concatenate(varRecordQRC.'Proposed solution Comment',Char(10),User().FullName & "[" & varUserRole & "]" & "(" & Text(Today(),"dd.mm.yyyy") & "): " & input_DetailProposedSolution_comment_QRC.Text))
            'Relevant policies Comment': If(
            Len(Substitute(Substitute(input_DetailRelevantPolicies_comment_QRC.Text, "Comments for Relevant policies section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Relevant policies Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Relevant policies Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Relevant policies Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_DetailRelevantPolicies_comment_QRC.Text),
                    varRecordQRC.'Relevant policies Comment',
                    ""
                )
            ), varRecordQRC.'Relevant policies Comment'
        ),
            'Data Comment': If(
            Len(Substitute(Substitute(input_DetailData_comment_QRC.Text, "Comments for Data section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Data Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Data Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Data Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_DetailData_comment_QRC.Text),
                    varRecordQRC.'Data Comment',
                    ""
                )
            ), varRecordQRC.'Data Comment'
        ), 
            'Personal data included': {Value: RadioGroup_PersonalData_Detail_QRC.Selected.Value},
            'Data classification': {Value: RadioGroup_DataClasification_Detail_QRC.Selected.Value},
            'Identified risk description and assessment': {Value: RadioGroup_IdentifiedRisk_Detail_QRC.Selected.Value},
            'Comment BUCO': input_finalComment_QRC.Text,
            'BUCO approved': true,
            'Risk Comment': If(
            Len(Substitute(Substitute(input_RiskData_comment_QRC.Text, "Comments for Risk section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Risk Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Risk Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Risk Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_RiskData_comment_QRC.Text),
                    varRecordQRC.'Risk Comment',
                    ""
                )
            ), varRecordQRC.'Risk Comment'
        ),
            'Mitigating procedures Comment': If(
            Len(Substitute(Substitute(input_ProceduresPolicies_comment_QRC.Text, "Comments for Mitigatin procedures section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Mitigating procedures Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Mitigating procedures Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Mitigating procedures Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_ProceduresPolicies_comment_QRC.Text),
                    varRecordQRC.'Mitigating procedures Comment',
                    ""
                )
            ), varRecordQRC.'Mitigating procedures Comment'
        ),
            'Residual risk Comment': If(
            Len(Substitute(Substitute(input_ResidualRiskData_comment_QRC.Text, "Comments for Residual risk section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecord.'Residual risk Comment', Char(10), "")),
            Concatenate(
                varRecord.'Residual risk Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Mitigating procedures Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_ResidualRiskData_comment_QRC.Text),
                    varRecord.'Residual risk Comment',
                    ""
                )
            ), varRecord.'Residual risk Comment'
        ),
            'Decision proposal Comment': If(
            Len(Substitute(Substitute(input_DecisionProposalDetail_comment_QRC.Text, "Comments for Decision proposal section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Decision proposal Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Decision proposal Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Decision proposal Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_DecisionProposalDetail_comment_QRC.Text),
                    varRecordQRC.'Decision proposal Comment',
                    ""
                )
            ), varRecordQRC.'Decision proposal Comment'
        ),
            'Owner & risk statement Comment': If(
            Len(Substitute(Substitute(input_OwnerRiskStatement_comment_QRC.Text, "Comments for Risk statement section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Owner & risk statement Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Owner & risk statement Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Owner & risk statement Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_OwnerRiskStatement_comment_QRC.Text),
                    varRecordQRC.'Owner & risk statement Comment',
                    ""
                )
            ), varRecordQRC.'Owner & risk statement Comment'
        ),
            'IRM & CPL Statement Comment': If(
            Len(Substitute(Substitute(input_Statement_comment_QRC.Text, "Comments for IRM & CPL section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'IRM & CPL Statement Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'IRM & CPL Statement Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'IRM & CPL Statement Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_Statement_comment_QRC.Text),
                    varRecordQRC.'IRM & CPL Statement Comment',
                    ""
                )
            ), varRecordQRC.'IRM & CPL Statement Comment'
        )            
        }, FormQRC_Attachments_edit.Updates
    ),
    "LORM",
    Patch(
        'QRC Topics Repository',
        LookUp(
            'QRC Topics Repository',
            ID = varRecordQRC.ID
        ),
        {
            Status: {Value: "For IRM"},
            'IT LORM approved': true,
            'Inherent risk impact': {Value: RadioGroup_InherentRiskImpact_Detail_QRC.Selected.Value},
            'Risk score': {Value: RadioGroup_RiskScore_Detail_QRC.Selected.Value},
            Likelihood: {Value: RadioGroup_Likelihood_Detail_QRC.Selected.Value},
            'Risk assessed by LORM': {
                DisplayName: User().FullName,
                Claims: User().Email,
                Department: "",
                Email: User().Email,
                JobTitle: "",
                Picture: ""
            },
            'Residual risk impact': {Value: RadioGroup_ResidualRiskImpact_detail_QRC.Selected.Value},
            'Residual risk score': {Value: RadioGroup_ResidualRiskScore_detail_QRC.Selected.Value},
            'Residual likelihood': {Value: RadioGroup_ResidualLikelihood_detail_QRC.Selected.Value},
            'Residual risk assessed by LORM': {
                DisplayName: User().FullName,
                Claims: User().Email,
                Department: "",
                Email: User().Email,
                JobTitle: "",
                Picture: ""
            },
            'Comment IT LORM': input_finalComment_QRC.Text,
            'Issue Comment': If(
            Len(Substitute(Substitute(input_Detail_issue_comment_QRC.Text, "Comments for Issue section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Issue Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Issue Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Issue Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_Detail_issue_comment_QRC.Text),
                    varRecordQRC.'Issue Comment',
                    ""
                )
            ), varRecordQRC.'Issue Comment'
        ),
            'Proposed solution Comment': If(
            Len(Substitute(Substitute(input_DetailProposedSolution_comment_QRC.Text, "Comments for Proposed solution section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Proposed solution Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Proposed solution Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Proposed solution Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_DetailProposedSolution_comment_QRC.Text),
                    varRecordQRC.'Proposed solution Comment',
                    ""
                )
            ), varRecordQRC.'Proposed solution Comment'
        ),
            'Relevant policies Comment': If(
            Len(Substitute(Substitute(input_DetailRelevantPolicies_comment_QRC.Text, "Comments for Relevant policies section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Relevant policies Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Relevant policies Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Relevant policies Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_DetailRelevantPolicies_comment_QRC.Text),
                    varRecordQRC.'Relevant policies Comment',
                    ""
                )
            ), varRecordQRC.'Relevant policies Comment'
        ),
            'Data Comment': If(
            Len(Substitute(Substitute(input_DetailData_comment_QRC.Text, "Comments for Data section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Data Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Data Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Data Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_DetailData_comment_QRC.Text),
                    varRecordQRC.'Data Comment',
                    ""
                )
            ), varRecordQRC.'Data Comment'
        ),
            'Risk Comment': If(
            Len(Substitute(Substitute(input_RiskData_comment_QRC.Text, "Comments for Risk section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Risk Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Risk Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Risk Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_RiskData_comment_QRC.Text),
                    varRecordQRC.'Risk Comment',
                    ""
                )
            ), varRecordQRC.'Risk Comment'
        ),
            'Mitigating procedures Comment': If(
            Len(Substitute(Substitute(input_ProceduresPolicies_comment_QRC.Text, "Comments for Mitigatin procedures section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Mitigating procedures Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Mitigating procedures Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Mitigating procedures Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_ProceduresPolicies_comment_QRC.Text),
                    varRecordQRC.'Mitigating procedures Comment',
                    ""
                )
            ), varRecordQRC.'Mitigating procedures Comment'
        ),
            'Residual risk Comment': If(
            Len(Substitute(Substitute(input_ResidualRiskData_comment_QRC.Text, "Comments for Residual risk section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecord.'Residual risk Comment', Char(10), "")),
            Concatenate(
                varRecord.'Residual risk Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Mitigating procedures Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_ResidualRiskData_comment_QRC.Text),
                    varRecord.'Residual risk Comment',
                    ""
                )
            ), varRecord.'Residual risk Comment'
        ),
            'Decision proposal Comment': If(
            Len(Substitute(Substitute(input_DecisionProposalDetail_comment_QRC.Text, "Comments for Decision proposal section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Decision proposal Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Decision proposal Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Decision proposal Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_DecisionProposalDetail_comment_QRC.Text),
                    varRecordQRC.'Decision proposal Comment',
                    ""
                )
            ), varRecordQRC.'Decision proposal Comment'
        ),
            'Owner & risk statement Comment': If(
            Len(Substitute(Substitute(input_OwnerRiskStatement_comment_QRC.Text, "Comments for Risk statement section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Owner & risk statement Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Owner & risk statement Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Owner & risk statement Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_OwnerRiskStatement_comment_QRC.Text),
                    varRecordQRC.'Owner & risk statement Comment',
                    ""
                )
            ), varRecordQRC.'Owner & risk statement Comment'
        ),
            'IRM & CPL Statement Comment': If(
            Len(Substitute(Substitute(input_Statement_comment_QRC.Text, "Comments for IRM & CPL section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'IRM & CPL Statement Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'IRM & CPL Statement Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'IRM & CPL Statement Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_Statement_comment_QRC.Text),
                    varRecordQRC.'IRM & CPL Statement Comment',
                    ""
                )
            ), varRecordQRC.'IRM & CPL Statement Comment'
        )
        }, FormQRC_Attachments_edit.Updates
    ),
    "DATA Owner",
    Patch(
        'QRC Topics Repository',
        LookUp(
            'QRC Topics Repository',
            ID = varRecordQRC.ID
        ),
        {
            Status: {Value: "Approved for commission"},
            'DATA approved': true,
            'Comment owner': input_finalComment_QRC.Text,
            'Issue Comment': If(
            Len(Substitute(Substitute(input_Detail_issue_comment_QRC.Text, "Comments for Issue section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Issue Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Issue Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Issue Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_Detail_issue_comment_QRC.Text),
                    varRecordQRC.'Issue Comment',
                    ""
                )
            ), varRecordQRC.'Issue Comment'
        ),
            'Proposed solution Comment': If(
            Len(Substitute(Substitute(input_DetailProposedSolution_comment_QRC.Text, "Comments for Proposed solution section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Proposed solution Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Proposed solution Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Proposed solution Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_DetailProposedSolution_comment_QRC.Text),
                    varRecordQRC.'Proposed solution Comment',
                    ""
                )
            ), varRecordQRC.'Proposed solution Comment'
        ),
            'Relevant policies Comment': If(
            Len(Substitute(Substitute(input_DetailRelevantPolicies_comment_QRC.Text, "Comments for Relevant policies section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Relevant policies Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Relevant policies Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Relevant policies Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_DetailRelevantPolicies_comment_QRC.Text),
                    varRecordQRC.'Relevant policies Comment',
                    ""
                )
            ), varRecordQRC.'Relevant policies Comment'
        ),
            'Data Comment': If(
            Len(Substitute(Substitute(input_DetailData_comment_QRC.Text, "Comments for Data section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Data Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Data Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Data Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_DetailData_comment_QRC.Text),
                    varRecordQRC.'Data Comment',
                    ""
                )
            ), varRecordQRC.'Data Comment'
        ),
            'Risk Comment': If(
            Len(Substitute(Substitute(input_RiskData_comment_QRC.Text, "Comments for Risk section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Risk Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Risk Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Risk Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_RiskData_comment_QRC.Text),
                    varRecordQRC.'Risk Comment',
                    ""
                )
            ), varRecordQRC.'Risk Comment'
        ),
            'Mitigating procedures Comment': If(
            Len(Substitute(Substitute(input_ProceduresPolicies_comment_QRC.Text, "Comments for Mitigatin procedures section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Mitigating procedures Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Mitigating procedures Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Mitigating procedures Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_ProceduresPolicies_comment_QRC.Text),
                    varRecordQRC.'Mitigating procedures Comment',
                    ""
                )
            ), varRecordQRC.'Mitigating procedures Comment'
        ),
            'Residual risk Comment': If(
            Len(Substitute(Substitute(input_ResidualRiskData_comment_QRC.Text, "Comments for Residual risk section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecord.'Residual risk Comment', Char(10), "")),
            Concatenate(
                varRecord.'Residual risk Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Mitigating procedures Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_ResidualRiskData_comment_QRC.Text),
                    varRecord.'Residual risk Comment',
                    ""
                )
            ), varRecord.'Residual risk Comment'
        ),
            'Decision proposal Comment': If(
            Len(Substitute(Substitute(input_DecisionProposalDetail_comment_QRC.Text, "Comments for Decision proposal section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Decision proposal Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Decision proposal Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Decision proposal Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_DecisionProposalDetail_comment_QRC.Text),
                    varRecordQRC.'Decision proposal Comment',
                    ""
                )
            ), varRecordQRC.'Decision proposal Comment'
        ),
            'Owner & risk statement Comment': If(
            Len(Substitute(Substitute(input_OwnerRiskStatement_comment_QRC.Text, "Comments for Risk statement section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Owner & risk statement Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Owner & risk statement Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Owner & risk statement Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_OwnerRiskStatement_comment_QRC.Text),
                    varRecordQRC.'Owner & risk statement Comment',
                    ""
                )
            ), varRecordQRC.'Owner & risk statement Comment'
        ),
            'IRM & CPL Statement Comment': If(
            Len(Substitute(Substitute(input_Statement_comment_QRC.Text, "Comments for IRM & CPL section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'IRM & CPL Statement Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'IRM & CPL Statement Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'IRM & CPL Statement Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_Statement_comment_QRC.Text),
                    varRecordQRC.'IRM & CPL Statement Comment',
                    ""
                )
            ), varRecordQRC.'IRM & CPL Statement Comment'
        )
        }
    ),
    "IRM",
    Patch(
        'QRC Topics Repository',
        LookUp(
            'QRC Topics Repository',
            ID = varRecordQRC.ID
        ),
        {
            Status: {Value: "For Data Owner"},
            'IRM approved': true,
            'IRM and CPL Statement': RichTextInput_BusinessStatement_QRC_edit.HtmlText,
            'IRM Comment': input_finalComment_QRC.Text,
            'Issue Comment': If(
            Len(Substitute(Substitute(input_Detail_issue_comment_QRC.Text, "Comments for Issue section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Issue Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Issue Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Issue Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_Detail_issue_comment_QRC.Text),
                    varRecordQRC.'Issue Comment',
                    ""
                )
            ), varRecordQRC.'Issue Comment'
        ),
            'Proposed solution Comment': If(
            Len(Substitute(Substitute(input_DetailProposedSolution_comment_QRC.Text, "Comments for Proposed solution section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Proposed solution Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Proposed solution Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Proposed solution Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_DetailProposedSolution_comment_QRC.Text),
                    varRecordQRC.'Proposed solution Comment',
                    ""
                )
            ), varRecordQRC.'Proposed solution Comment'
        ),
            'Relevant policies Comment': If(
            Len(Substitute(Substitute(input_DetailRelevantPolicies_comment_QRC.Text, "Comments for Relevant policies section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Relevant policies Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Relevant policies Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Relevant policies Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_DetailRelevantPolicies_comment_QRC.Text),
                    varRecordQRC.'Relevant policies Comment',
                    ""
                )
            ), varRecordQRC.'Relevant policies Comment'
        ),
            'Data Comment': If(
            Len(Substitute(Substitute(input_DetailData_comment_QRC.Text, "Comments for Data section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Data Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Data Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Data Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_DetailData_comment_QRC.Text),
                    varRecordQRC.'Data Comment',
                    ""
                )
            ), varRecordQRC.'Data Comment'
        ),
            'Risk Comment': If(
            Len(Substitute(Substitute(input_RiskData_comment_QRC.Text, "Comments for Risk section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Risk Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Risk Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Risk Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_RiskData_comment_QRC.Text),
                    varRecordQRC.'Risk Comment',
                    ""
                )
            ), varRecordQRC.'Risk Comment'
        ),
            'Mitigating procedures Comment': If(
            Len(Substitute(Substitute(input_ProceduresPolicies_comment_QRC.Text, "Comments for Mitigatin procedures section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Mitigating procedures Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Mitigating procedures Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Mitigating procedures Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_ProceduresPolicies_comment_QRC.Text),
                    varRecordQRC.'Mitigating procedures Comment',
                    ""
                )
            ), varRecordQRC.'Mitigating procedures Comment'
        ),
            'Residual risk Comment': If(
            Len(Substitute(Substitute(input_ResidualRiskData_comment_QRC.Text, "Comments for Residual risk section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecord.'Residual risk Comment', Char(10), "")),
            Concatenate(
                varRecord.'Residual risk Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Mitigating procedures Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_ResidualRiskData_comment_QRC.Text),
                    varRecord.'Residual risk Comment',
                    ""
                )
            ), varRecord.'Residual risk Comment'
        ),
            'Decision proposal Comment': If(
            Len(Substitute(Substitute(input_DecisionProposalDetail_comment_QRC.Text, "Comments for Decision proposal section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Decision proposal Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Decision proposal Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Decision proposal Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_DecisionProposalDetail_comment_QRC.Text),
                    varRecordQRC.'Decision proposal Comment',
                    ""
                )
            ), varRecordQRC.'Decision proposal Comment'
        ),
            'Owner & risk statement Comment': If(
            Len(Substitute(Substitute(input_OwnerRiskStatement_comment_QRC.Text, "Comments for Risk statement section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'Owner & risk statement Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'Owner & risk statement Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'Owner & risk statement Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_OwnerRiskStatement_comment_QRC.Text),
                    varRecordQRC.'Owner & risk statement Comment',
                    ""
                )
            ), varRecordQRC.'Owner & risk statement Comment'
        ),
            'IRM & CPL Statement Comment': If(
            Len(Substitute(Substitute(input_Statement_comment_QRC.Text, "Comments for IRM & CPL section: ", "", 1), Char(10), "")) <> Len(Substitute(varRecordQRC.'IRM & CPL Statement Comment', Char(10), "")),
            Concatenate(
                varRecordQRC.'IRM & CPL Statement Comment',
                Char(10),
                Substitute(
                    varRecordQRC.'IRM & CPL Statement Comment' & (User().FullName & " [" & varUserRole & "]" & " (" & Text(
                        Today(),
                        "dd.mm.yyyy"
                    ) & "): " & input_Statement_comment_QRC.Text),
                    varRecordQRC.'IRM & CPL Statement Comment',
                    ""
                )
            ), varRecordQRC.'IRM & CPL Statement Comment'
        )
        }, FormQRC_Attachments_edit.Updates
    )
);
Set(
    varSpinner,
    false
);
Set(varRecordQRC, LookUp('QRC Topics Repository', ID = varRecordQRC.ID))