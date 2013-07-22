<div class="dwa-block clearfix">
    <div class="dwa-blockcontent">
        <form name=lang_form method=post>

            <!--
                    window.location='index.php?new_language='+lang_form.lang.value;
            -->

            <select name=lang onChange="JavaScript:lang_form.submit();">
                {section name=i loop=$lang_list}
                    <option value={$smarty.section.i.index}
                            {if $current_language == $smarty.section.i.index}
                                selected
                            {/if}
                            >
                        {$lang_list[i]->description}
                    </option>
                {/section}
            </select>

        </form>
    </div>
</div>