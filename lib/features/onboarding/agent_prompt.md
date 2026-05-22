# Design Export Context

- Generated at: `2026-04-21T17:26:19.537Z`
- Document ID: `5230f768-cbc2-414a-9eae-c8be387f41c7`
- Page count: 1

## Original Prompt

```text
Link saving and management app
```

## Theme (JSON)

```json
{
  "fonts": {
    "primary": "google:Oswald",
    "secondary": "google:Space Grotesk"
  },
  "colors": {
    "light": {
      "primary": "#D90429",
      "on_primary": "#EDF2F4",
      "secondary": "#8D99AE",
      "on_secondary": "#000000",
      "accent": "#EDF2F4",
      "background": "#000000",
      "surface": "#1A1A1A",
      "on_surface": "#EDF2F4",
      "primary_text": "#EDF2F4",
      "secondary_text": "#8D99AE",
      "hint": "#8D99AE",
      "error": "#D90429",
      "on_error": "#EDF2F4",
      "success": "#34C759",
      "divider": "#D90429",
      "transparent": "#00000000"
    },
    "dark": {
      "primary": "#D90429",
      "on_primary": "#EDF2F4",
      "secondary": "#8D99AE",
      "on_secondary": "#000000",
      "accent": "#EDF2F4",
      "background": "#000000",
      "surface": "#1A1A1A",
      "on_surface": "#EDF2F4",
      "primary_text": "#EDF2F4",
      "secondary_text": "#8D99AE",
      "hint": "#8D99AE",
      "error": "#D90429",
      "on_error": "#EDF2F4",
      "success": "#30D158",
      "divider": "#D90429",
      "transparent": "#00000000"
    }
  },
  "text_styles": {
    "headline_large": {
      "font": "primary",
      "size": 48,
      "weight": 700,
      "height": 1
    },
    "headline_medium": {
      "font": "primary",
      "size": 32,
      "weight": 700,
      "height": 1.1
    },
    "title_large": {
      "font": "primary",
      "size": 22,
      "weight": 600,
      "height": 1.2
    },
    "title_medium": {
      "font": "secondary",
      "size": 17,
      "weight": 700,
      "height": 1.2
    },
    "body_large": {
      "font": "secondary",
      "size": 17,
      "weight": 400,
      "height": 1.4
    },
    "body_medium": {
      "font": "secondary",
      "size": 15,
      "weight": 400,
      "height": 1.4
    },
    "body_small": {
      "font": "secondary",
      "size": 13,
      "weight": 400,
      "height": 1.4
    },
    "label_large": {
      "font": "primary",
      "size": 15,
      "weight": 600,
      "height": 1.2
    },
    "label_medium": {
      "font": "primary",
      "size": 13,
      "weight": 600,
      "height": 1.2
    },
    "label_small": {
      "font": "primary",
      "size": 11,
      "weight": 600,
      "height": 1.2
    }
  },
  "spacing": {
    "xs": 4,
    "sm": 8,
    "md": 16,
    "lg": 32,
    "xl": 64
  },
  "radii": {
    "sm": 0,
    "md": 0,
    "lg": 0,
    "full": 0
  },
  "shadows": {
    "sm": {
      "color": "#D90429",
      "dx": 2,
      "dy": 2,
      "blur": 0,
      "spread": 0
    },
    "md": {
      "color": "#8D99AE",
      "dx": 4,
      "dy": 4,
      "blur": 0,
      "spread": 0
    },
    "lg": {
      "color": "#D90429",
      "dx": 6,
      "dy": 6,
      "blur": 0,
      "spread": 0
    },
    "xl": {
      "color": "#D90429",
      "dx": 8,
      "dy": 8,
      "blur": 0,
      "spread": 0
    }
  }
}
```

## Pages

### 1. Onboarding

- Frame ID: `frame2`
- Original page prompt: "A welcome page explaining link organization and browser extension integration"
- Follow-up prompts: _None_

#### DslDocument (JSON)

```json
{
  "root": {
    "type": "scaffold",
    "properties": {
      "bg": {
        "color": {
          "color": "background"
        }
      },
      "safe_area": {
        "boolVal": {
          "value": true
        }
      }
    },
    "children": [
      {
        "type": "column",
        "properties": {
          "scroll": {
            "boolVal": {
              "value": true
            }
          },
          "padding": {
            "edgeInsets": {
              "top": 0,
              "right": 0,
              "bottom": 0,
              "left": 0,
              "token": "lg"
            }
          },
          "spacing": {
            "stringVal": {
              "value": "xl"
            }
          },
          "cross_align": {
            "align": {
              "named": "stretch"
            }
          }
        },
        "children": [
          {
            "type": "row",
            "properties": {
              "align": {
                "align": {
                  "named": "space_between"
                }
              },
              "cross_align": {
                "align": {
                  "named": "center"
                }
              }
            },
            "children": [
              {
                "type": "column",
                "properties": {
                  "cross_align": {
                    "align": {
                      "named": "start"
                    }
                  },
                  "spacing": {
                    "numberVal": {
                      "value": 0
                    }
                  }
                },
                "children": [
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "LINK"
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "title_medium"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "secondary_text"
                        }
                      },
                      "font_weight": {
                        "numberVal": {
                          "value": 300
                        }
                      }
                    },
                    "editorId": "text33"
                  },
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "VAULT"
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "headline_medium"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "primary_text"
                        }
                      },
                      "font_weight": {
                        "numberVal": {
                          "value": 900
                        }
                      }
                    },
                    "editorId": "text34"
                  }
                ],
                "editorId": "column13"
              },
              {
                "type": "container",
                "properties": {
                  "padding": {
                    "edgeInsets": {
                      "top": 0,
                      "right": 0,
                      "bottom": 0,
                      "left": 0,
                      "topToken": "sm",
                      "rightToken": "md",
                      "bottomToken": "sm",
                      "leftToken": "md"
                    }
                  },
                  "border": {
                    "border": {
                      "width": 1,
                      "color": "secondary"
                    }
                  },
                  "radius": {
                    "radius": {
                      "topLeft": 0,
                      "topRight": 0,
                      "bottomLeft": 0,
                      "bottomRight": 0,
                      "token": "sm"
                    }
                  }
                },
                "children": [
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "SKIP_INTRO"
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "label_small"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "secondary_text"
                        }
                      }
                    },
                    "editorId": "text35"
                  }
                ],
                "editorId": "container21"
              }
            ],
            "editorId": "row17"
          },
          {
            "type": "column",
            "properties": {
              "spacing": {
                "stringVal": {
                  "value": "xl"
                }
              },
              "cross_align": {
                "align": {
                  "named": "stretch"
                }
              }
            },
            "children": [
              {
                "type": "@onboarding_step",
                "properties": {
                  "lottie_desc": {
                    "stringVal": {
                      "value": "abstract geometric link nodes connecting"
                    }
                  },
                  "step_num": {
                    "stringVal": {
                      "value": "01"
                    }
                  },
                  "title": {
                    "stringVal": {
                      "value": "CAPTURE_EVERYTHING"
                    }
                  },
                  "description": {
                    "stringVal": {
                      "value": "Save URLs instantly. LinkVault automatically generates summaries, fetches favicons, and suggests relevant tags for your collection."
                    }
                  }
                },
                "editorId": "step1"
              },
              {
                "type": "column",
                "properties": {
                  "spacing": {
                    "stringVal": {
                      "value": "lg"
                    }
                  }
                },
                "children": [
                  {
                    "type": "@onboarding_step",
                    "properties": {
                      "lottie_desc": {
                        "stringVal": {
                          "value": "browser window with a popup extension interface"
                        }
                      },
                      "step_num": {
                        "stringVal": {
                          "value": "02"
                        }
                      },
                      "title": {
                        "stringVal": {
                          "value": "BROWSER_POWER"
                        }
                      },
                      "description": {
                        "stringVal": {
                          "value": "Install our high-velocity extension to save links without leaving your current tab. One click, infinite organization."
                        }
                      }
                    },
                    "editorId": "step2"
                  },
                  {
                    "type": "column",
                    "properties": {
                      "spacing": {
                        "stringVal": {
                          "value": "sm"
                        }
                      }
                    },
                    "children": [
                      {
                        "type": "text",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "SUPPORTED_PLATFORMS"
                            }
                          },
                          "style": {
                            "textStyle": {
                              "styleName": "label_small"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "secondary_text"
                            }
                          }
                        },
                        "editorId": "text36"
                      },
                      {
                        "type": "wrap",
                        "properties": {
                          "spacing": {
                            "stringVal": {
                              "value": "md"
                            }
                          },
                          "run_spacing": {
                            "stringVal": {
                              "value": "md"
                            }
                          }
                        },
                        "children": [
                          {
                            "type": "@extension_badge",
                            "properties": {
                              "browser": {
                                "stringVal": {
                                  "value": "googlechrome"
                                }
                              },
                              "name": {
                                "stringVal": {
                                  "value": "Chrome"
                                }
                              }
                            },
                            "editorId": "extensionbadge1"
                          },
                          {
                            "type": "@extension_badge",
                            "properties": {
                              "browser": {
                                "stringVal": {
                                  "value": "firefox"
                                }
                              },
                              "name": {
                                "stringVal": {
                                  "value": "Firefox"
                                }
                              }
                            },
                            "editorId": "extensionbadge2"
                          },
                          {
                            "type": "@extension_badge",
                            "properties": {
                              "browser": {
                                "stringVal": {
                                  "value": "safari"
                                }
                              },
                              "name": {
                                "stringVal": {
                                  "value": "Safari"
                                }
                              }
                            },
                            "editorId": "extensionbadge3"
                          },
                          {
                            "type": "@extension_badge",
                            "properties": {
                              "browser": {
                                "stringVal": {
                                  "value": "microsoftedge"
                                }
                              },
                              "name": {
                                "stringVal": {
                                  "value": "Edge"
                                }
                              }
                            },
                            "editorId": "extensionbadge4"
                          }
                        ],
                        "editorId": "wrap1"
                      }
                    ],
                    "editorId": "column16"
                  }
                ],
                "editorId": "column15"
              },
              {
                "type": "@onboarding_step",
                "properties": {
                  "lottie_desc": {
                    "stringVal": {
                      "value": "kinetic typography fast search animation"
                    }
                  },
                  "step_num": {
                    "stringVal": {
                      "value": "03"
                    }
                  },
                  "title": {
                    "stringVal": {
                      "value": "VELOCITY_SEARCH"
                    }
                  },
                  "description": {
                    "stringVal": {
                      "value": "Find any link in milliseconds with our command-palette style search. Your personal web archive, indexed and ready."
                    }
                  }
                },
                "editorId": "step3"
              }
            ],
            "editorId": "column14"
          },
          {
            "type": "column",
            "properties": {
              "spacing": {
                "stringVal": {
                  "value": "md"
                }
              },
              "padding": {
                "edgeInsets": {
                  "top": 0,
                  "right": 0,
                  "bottom": 0,
                  "left": 0,
                  "bottomToken": "xl"
                }
              }
            },
            "children": [
              {
                "type": "container",
                "properties": {
                  "bg": {
                    "color": {
                      "color": "primary"
                    }
                  },
                  "height": {
                    "px": {
                      "value": 64,
                      "isInfinity": false
                    }
                  },
                  "radius": {
                    "radius": {
                      "topLeft": 0,
                      "topRight": 0,
                      "bottomLeft": 0,
                      "bottomRight": 0
                    }
                  },
                  "align_child": {
                    "align": {
                      "named": "center"
                    }
                  },
                  "shadow": {
                    "stringVal": {
                      "value": "md"
                    }
                  }
                },
                "children": [
                  {
                    "type": "row",
                    "properties": {
                      "align": {
                        "align": {
                          "named": "center"
                        }
                      },
                      "spacing": {
                        "stringVal": {
                          "value": "md"
                        }
                      }
                    },
                    "children": [
                      {
                        "type": "text",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "INITIALIZE_VAULT"
                            }
                          },
                          "style": {
                            "textStyle": {
                              "styleName": "title_medium"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "on_primary"
                            }
                          },
                          "font_weight": {
                            "numberVal": {
                              "value": 700
                            }
                          }
                        },
                        "editorId": "text37"
                      },
                      {
                        "type": "icon",
                        "properties": {
                          "name": {
                            "icon": {
                              "name": "arrow_forward_rounded"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "on_primary"
                            }
                          },
                          "size": {
                            "numberVal": {
                              "value": 24
                            }
                          }
                        },
                        "editorId": "icon11"
                      }
                    ],
                    "editorId": "row18"
                  }
                ],
                "editorId": "container22"
              },
              {
                "type": "container",
                "properties": {
                  "border": {
                    "border": {
                      "width": 2,
                      "color": "primary"
                    }
                  },
                  "height": {
                    "px": {
                      "value": 64,
                      "isInfinity": false
                    }
                  },
                  "radius": {
                    "radius": {
                      "topLeft": 0,
                      "topRight": 0,
                      "bottomLeft": 0,
                      "bottomRight": 0
                    }
                  },
                  "align_child": {
                    "align": {
                      "named": "center"
                    }
                  }
                },
                "children": [
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "ALREADY_A_MEMBER?_SIGN_IN"
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "label_large"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "primary_text"
                        }
                      }
                    },
                    "editorId": "text38"
                  }
                ],
                "editorId": "container23"
              }
            ],
            "editorId": "column17"
          },
          {
            "type": "container",
            "properties": {
              "height": {
                "px": {
                  "value": 4,
                  "isInfinity": false
                }
              },
              "bg": {
                "color": {
                  "color": "divider"
                }
              },
              "width": {
                "px": {
                  "value": "Infinity",
                  "isInfinity": true
                }
              }
            },
            "children": [
              {
                "type": "container",
                "properties": {
                  "align": {
                    "align": {
                      "named": "left"
                    }
                  },
                  "width": {
                    "percent": {
                      "value": 33
                    }
                  },
                  "bg": {
                    "color": {
                      "color": "primary"
                    }
                  },
                  "height": {
                    "px": {
                      "value": 4,
                      "isInfinity": false
                    }
                  }
                },
                "editorId": "container25"
              }
            ],
            "editorId": "container24"
          }
        ],
        "editorId": "column12"
      }
    ],
    "editorId": "scaffold1"
  }
}
```