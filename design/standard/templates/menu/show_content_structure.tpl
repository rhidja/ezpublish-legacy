{let parentNode     = $contentStructureTree.parent_node
     children       = $contentStructureTree.children
     haveChildren   = count($contentStructureTree.children)|gt(0) 
     showToolTips   = ezini( 'TreeMenu', 'ToolTips', 'contentstructuremenu.ini' )
     toolTip        = "" }

    {*                                             
    <li id="n{$:parentNode.node_id}" style="list-style-type:none; white-space:nowrap; margin-left:1em">
    *}
    <li id="n{$:parentNode.node.node_id}" style="list-style-type:none; white-space:nowrap; margin-left:1em">
                                                      
        {* Fold/Unfold/Empty *}                                                                          
            {section show=$:haveChildren}
                <a  href="#" 
                    title={"Fold/Unfold"|i18n("menu/show_content_structure")}
                    onclick="ezcst_onFoldClicked( this.parentNode ); return false;" 
                    style="text-decoration:none; font-size:0.7em; font-family:monospace">
                    [-]
                </a>
            {section-else}
                <a style="font-size:0.7em; font-family:monospace; visibility:hidden">[ ]</a>
            {/section}
            
        {* Icon *}
            {*
            <a  href={$:parentNode.path_id_string|ezurl}>
            *}
            <a  href={$:parentNode.node.path_identification_string|ezurl}>
                {$:parentNode.object.class_identifier|class_icon( small, "Show 'Edit' menu" )}
            </a>
        
        {* Label *}
            {section show=$:showToolTips|eq('enabled')}
                {set toolTip = 'Node ID: %node_id Created: %created Children num: %children_num' | 
                                i18n("menu/show_content_structure", , hash( '%node_id'      , $:parentNode.node.node_id,
                                                                            '%created'      , $:parentNode.object.published|l10n(shortdatetime),
                                                                            '%children_num' , $:parentNode.node.children_count ) ) }
            {section-else}
                {set toolTip = ''}
            {/section}
                
            <a href={$:parentNode.node.path_identification_string|ezurl} title="{$:toolTip}">
                {$:parentNode.object.name|wash}
            </a>
        
        {* Show children *}    
            {section show=$:haveChildren}
                <ul>
                    {section var=child loop=$:children}
                        {include uri="design:menu/show_content_structure.tpl" contentStructureTree=$:child}
                    {/section}
                </ul>
            {/section}        
    </li>
{/let}
                                                    
