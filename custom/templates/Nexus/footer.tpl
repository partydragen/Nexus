{if $MINECRAFTVIEW eq '1'}
<span style="visibility: hidden;" id="ip">{$MINECRAFTIP}{if ($MINECRAFTPORT != 25565)}:{$MINECRAFTPORT}{/if}</span>
{/if}
</div>
</div>

<div class="ui inverted vertical footer segment" id="footer">
  <div class="ui center aligned container">
    <div class="ui stackable inverted divided grid">
      <div class="five wide column">
        <h4><span class="item">&copy; {$SITE_NAME} {'Y'|date}</span></h4>
        <div class="ui inverted link list">
          <span class="item">Powered By <a href="https://namelessmc.com">NamelessMC</a></span>
          {* We kindly ask to not remove the copyright *}
          <span class="item">Template By <a href="https://github.com/VertisanPRO" target="_blank"
              rel="nofollow noopener">Vertisan</a></span>
          {if $PAGE_LOAD_TIME}
          <span class="item" id="page_load"></span>
          {/if}
          <a class="item" href="javascript:" onclick="toggleDarkLightMode()">{$TOGGLE_DARK_MODE_TEXT}</a>
        </div>
      </div>
      {if $SOCIAL_MEDIA_ICONS|count eq '0'} <div class="six wide column">
        <h4>About</h4>
        <p>
          {$FOOTERABOUT}
        </p>
      </div>
      {/if}
      <div class="{if $SOCIAL_MEDIA_ICONS|count > 0}three{else}five{/if} wide column">
        <h4>{$FOOTER_LINKS_TITLE}</h4>
        <div class="ui inverted link list">
          {foreach from=$FOOTER_NAVIGATION key=name item=item}
          {if isset($item.items)}
          <div class="ui pointing dropdown link item">
            <span class="text">{$item.icon} {$item.title}</span> <i class="dropdown icon"></i>
            <div class="menu">
              <div class="header">{$item.title}</div>
              {foreach from=$item.items item=dropdown}
              <a class="item" href="{$dropdown.link}" target="{$dropdown.target}">{$dropdown.icon}
                {$dropdown.title}</a>
              {/foreach}
            </div>
          </div>
          {else}
          <a class="item" href="{$item.link}" target="{$item.target}">{$item.icon} {$item.title}</a>
          {/if}
          {/foreach}
          <a class="item" href="{$TERMS_LINK}">{$TERMS_TEXT}</a>
          <a class="item" href="{$PRIVACY_LINK}">{$PRIVACY_TEXT}</a>
        </div>
      </div>
      {if $SOCIAL_MEDIA_ICONS|count > 0}
      <div class="three wide column">
        <h4>{$FOOTER_SOCIAL_TITLE}</h4>
        <div class="ui inverted link list">
          {foreach from=$SOCIAL_MEDIA_ICONS item=icon}
          <a class="item" href="{$icon.link}">{$icon.text}</a>
          {/foreach}
        </div>
      </div>
      {/if}
      {if $SOCIAL_MEDIA_ICONS|count > 0}
      <div class="five wide column">
        <h4>About</h4>
        <p>
          {$FOOTERABOUT}
        </p>
      </div>
      {/if}
    </div>
  </div>
</div>

{if isset($GLOBAL_WARNING_TITLE)}
<div class="ui medium modal" id="modal-acknowledge">
  <div class="header">
    {$GLOBAL_WARNING_TITLE}
  </div>
  <div class="content">
    {$GLOBAL_WARNING_REASON}
  </div>
  <div class="actions">
    <a class="ui positive button" href="{$GLOBAL_WARNING_ACKNOWLEDGE_LINK}">{$GLOBAL_WARNING_ACKNOWLEDGE}</a>
  </div>
</div>
{/if}

{foreach from=$TEMPLATE_JS item=script}
{$script}
{/foreach}

{if $MINECRAFTVIEW eq '1'}
{if $MINECRAFTSTYLE eq '0'}
{include file='Nexus/status/simple.tpl'}
{else}
{include file='Nexus/status/advanced.tpl'}
{/if}
{/if}

{if $WIDGETBOTVIEW eq '1'}
<script src="https://cdn.jsdelivr.net/npm/@widgetbot/crate@3" async defer>
  new Crate({
    server: '{$WIDGETBOTSERVERID}',
    channel: '{$WIDGETBOTCHANNELID}',
    location: ['{$WIDGETBOTVERTICALLOCATION}', '{$WIDGETBOTHORIZONTALLOCATION}'],
    {if $WIDGETBOTCOLOR eq '0'}
    {elseif $WIDGETBOTCOLOR eq '1'}
    {if $NEXUS_DARK_MODE eq '1' }
    color: '#303030',
    {else}
    color: '#e0e1e2',
    {/if}
    {elseif $WIDGETBOTCOLOR eq '2'}
    color: '{$WIDGETBOTCUSTOMCOLOR}',
    {/if}
  })
</script>
{/if}

{if isset($GLOBAL_WARNING_TITLE)}
<script type="text/javascript">
  $('#modal-acknowledge').modal({ closable: false }).modal('show');
</script>
{/if}

{if isset($NEW_UPDATE) && ($NEW_UPDATE_URGENT != true)}
<script src="{$TEMPLATE.path}/js/core/update.js"></script>
{/if}

{if !isset($EXCLUDE_END_BODY)}
{if isset($DEBUGBAR_HTML)}
{$DEBUGBAR_HTML}
{/if}

<script>
  function toggleDarkLightMode() {
    $.post("{$DARK_LIGHT_MODE_ACTION}", { token: "{$DARK_LIGHT_MODE_TOKEN}" })
      .done(function () {
        window.location.reload();
      });
    return false;
  }

  function dsInvite(link) {
    if (link !== '') {
      window.open(link);
    }
    return false;
  }

  {$CUSTOMJS}
</script>

{if $NEXUS_DARK_MODE eq '1' }
<script>
  function copy(element) {
    const temp = $('<input>');
    $('body').append(temp);
    temp.val($(element).text()).select();
    document.execCommand('copy');
    temp.remove();
    $('body').toast({
      showIcon: 'keyboard',
      message: 'Copied!',
      class: 'black',
      progressUp: true,
      displayTime: 2000,
      classProgress: 'white',
      showProgress: 'bottom',
      pauseOnHover: false,
    });
  };
</script>
{else}
<script>
  function copy(element) {
    var $temp = $('<input>');
    $('body').append($temp);
    $temp.val($(element).text()).select();
    document.execCommand('copy');
    $temp.remove();
    $('body').toast({
      showIcon: 'keyboard',
      message: 'Copied!',
      class: 'white',
      progressUp: true,
      displayTime: 2000,
      classProgress: 'black',
      showProgress: 'bottom',
      pauseOnHover: false,
    });
  };
</script>
{/if}

</body>

</html>
{/if}